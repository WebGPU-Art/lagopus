// based on https://github.com/williammalo/hsluv-glsl/blob/master/hsluv-glsl.fsh

fn hsluv_intersectLineLine(line1x: vec3f, line1y: vec3f, line2x: vec3f, line2y: vec3f) -> vec3f {
  return (line1y - line2y) / (line2x - line1x);
}

fn hsluv_distanceFromPole(pointx: vec3f,pointy: vec3f) -> vec3f {
  return sqrt(pointx*pointx + pointy*pointy);
}

fn hsluv_lengthOfRayUntilIntersect(theta: f32, x: vec3f, y: vec3f) -> vec3f {
  var len: vec3f = y / (sin(theta) - x * cos(theta));
  if (len.r < 0.0) {len.r=1000.0;}
  if (len.g < 0.0) {len.g=1000.0;}
  if (len.b < 0.0) {len.b=1000.0;}
  return len;
}

fn hsluv_maxSafeChromaForL(L: f32) -> f32 {
  const m2 = mat3x3(
       3.2409699419045214  ,-0.96924363628087983 , 0.055630079696993609,
      -1.5373831775700935  , 1.8759675015077207  ,-0.20397695888897657 ,
      -0.49861076029300328 , 0.041555057407175613, 1.0569715142428786
  );
  let sub0: f32 = L + 16.0;
  let sub1: f32 = sub0 * sub0 * sub0 * .000000641;
  var sub2: f32;
  if (sub1 > 0.0088564516790356308) {
    sub2 = sub1;
  } else {
    sub2 = L / 903.2962962962963;
  }

  let top1: vec3f   = (284517.0 * m2[0] - 94839.0  * m2[2]) * sub2;
  let bottom: vec3f = (632260.0 * m2[2] - 126452.0 * m2[1]) * sub2;
  let top2: vec3f   = (838422.0 * m2[2] + 769860.0 * m2[1] + 731718.0 * m2[0]) * L * sub2;

  let bounds0x: vec3f = top1 / bottom;
  let bounds0y: vec3f = top2 / bottom;

  let bounds1x: vec3f =              top1 / (bottom+126452.0);
  let bounds1y: vec3f = (top2 - 769860.0*L) / (bottom+126452.0);

  let xs0: vec3f = hsluv_intersectLineLine(bounds0x, bounds0y, -1.0/bounds0x, vec3(0.0) );
  let xs1: vec3f = hsluv_intersectLineLine(bounds1x, bounds1y, -1.0/bounds1x, vec3(0.0) );

  let lengths0: vec3f = hsluv_distanceFromPole( xs0, bounds0y + xs0 * bounds0x );
  let lengths1: vec3f = hsluv_distanceFromPole( xs1, bounds1y + xs1 * bounds1x );

  return  min(lengths0.r,
          min(lengths1.r,
          min(lengths0.g,
          min(lengths1.g,
          min(lengths0.b,
              lengths1.b)))));
}

fn hsluv_maxChromaForLH(L: f32, H: f32) -> f32 {

  let hrad: f32 = radians(H);

  let m2 = mat3x3(
       3.2409699419045214  ,-0.96924363628087983 , 0.055630079696993609,
      -1.5373831775700935  , 1.8759675015077207  ,-0.20397695888897657 ,
      -0.49861076029300328 , 0.041555057407175613, 1.0569715142428786
  );
  let sub1: f32 = pow(L + 16.0, 3.0) / 1560896.0;
  var sub2: f32;
  if (sub1 > 0.0088564516790356308) {
    sub2 = sub1;
  } else {
    sub2 = L / 903.2962962962963;
  }

  let top1: vec3f   = (284517.0 * m2[0] - 94839.0  * m2[2]) * sub2;
  let bottom: vec3f = (632260.0 * m2[2] - 126452.0 * m2[1]) * sub2;
  let top2: vec3f   = (838422.0 * m2[2] + 769860.0 * m2[1] + 731718.0 * m2[0]) * L * sub2;

  let bound0x: vec3f = top1 / bottom;
  let bound0y: vec3f = top2 / bottom;

  let bound1x: vec3f =              top1 / (bottom+126452.0);
  let bound1y: vec3f = (top2 - 769860.0*L) / (bottom+126452.0);

  let lengths0: vec3f = hsluv_lengthOfRayUntilIntersect(hrad, bound0x, bound0y );
  let lengths1: vec3f = hsluv_lengthOfRayUntilIntersect(hrad, bound1x, bound1y );

  return  min(lengths0.r,
          min(lengths1.r,
          min(lengths0.g,
          min(lengths1.g,
          min(lengths0.b,
              lengths1.b)))));
}

fn hsluv_fromLinear(c: f32) -> f32 {
  if (c <= 0.0031308) { return 12.92 * c; } else { return 1.055 * pow(c, 1.0 / 2.4) - 0.055; };
}
fn hsluv_fromLinear_vec3(c: vec3f) -> vec3f {
  return vec3( hsluv_fromLinear(c.r), hsluv_fromLinear(c.g), hsluv_fromLinear(c.b) );
}

fn hsluv_toLinear(c: f32) -> f32 {
  if (c > 0.04045) { return pow((c + 0.055) / (1.0 + 0.055), 2.4); } else { return c / 12.92; };
}

fn hsluv_toLinear_vec3(c: vec3f) -> vec3f {
  return vec3( hsluv_toLinear(c.r), hsluv_toLinear(c.g), hsluv_toLinear(c.b) );
}

fn hsluv_yToL(Y: f32) -> f32 {
  if (Y <= 0.0088564516790356308) { return Y * 903.2962962962963; } else { return 116.0 * pow(Y, 1.0 / 3.0) - 16.0; }
}

fn hsluv_lToY(L: f32) -> f32 {
  if (L <= 8.0) { return L / 903.2962962962963; } else { return pow((L + 16.0) / 116.0, 3.0); };
}

fn xyzToRgb(tuple: vec3f) -> vec3f {
  let m = mat3x3(
      3.2409699419045214  ,-1.5373831775700935 ,-0.49861076029300328 ,
     -0.96924363628087983 , 1.8759675015077207 , 0.041555057407175613,
      0.055630079696993609,-0.20397695888897657, 1.0569715142428786  );

  return hsluv_fromLinear_vec3(tuple*m);
}

fn rgbToXyz(tuple: vec3f) -> vec3f {
  const m = mat3x3(
      0.41239079926595948 , 0.35758433938387796, 0.18048078840183429 ,
      0.21263900587151036 , 0.71516867876775593, 0.072192315360733715,
      0.019330818715591851, 0.11919477979462599, 0.95053215224966058
  );
  return hsluv_toLinear_vec3(tuple) * m;
}

fn xyzToLuv(tuple: vec3f) -> vec3f {
  let X: f32 = tuple.x;
  let Y: f32 = tuple.y;
  let Z: f32 = tuple.z;

  let L: f32 = hsluv_yToL(Y);

  let div: f32 = 1. / dot(tuple, vec3<f32>(1.,15.,3.));

  return vec3(
      1.,
      (52. * (X*div) - 2.57179),
      (117.* (Y*div) - 6.08816)
  ) * L;
}


fn luvToXyz(tuple: vec3f) -> vec3f {
  let L: f32 = tuple.x;

  let U: f32 = tuple.y / (13.0 * L) + 0.19783000664283681;
  let V: f32 = tuple.z / (13.0 * L) + 0.468319994938791;

  let Y: f32 = hsluv_lToY(L);
  let X: f32 = 2.25 * U * Y / V;
  let Z: f32 = (3./V - 5.)*Y - (X/3.);

  return vec3(X, Y, Z);
}

fn luvToLch(tuple: vec3f) -> vec3f {
  let L: f32 = tuple.x;
  let U: f32 = tuple.y;
  let V: f32 = tuple.z;

  let C: f32 = length(tuple.yz);
  var H: f32 = degrees(atan2(V,U));
  if (H < 0.0) {
      H = 360.0 + H;
  }

  return vec3(L, C, H);
}

fn lchToLuv(tuple: vec3f) -> vec3f {
  let hrad: f32 = radians(tuple.b);
  return vec3(
      tuple.r,
      cos(hrad) * tuple.g,
      sin(hrad) * tuple.g
  );
}

fn hsluvToLch(tuple0: vec3f) -> vec3f {
  var tuple = tuple0;
  tuple.g *= hsluv_maxChromaForLH(tuple.b, tuple.r) * .01;
  return tuple.bgr;
}

fn lchToHsluv(tuple0: vec3f) -> vec3f {
  var tuple = tuple0;
  tuple.g /= hsluv_maxChromaForLH(tuple.r, tuple.b) * .01;
  return tuple.bgr;
}

fn hpluvToLch(tuple0: vec3f) -> vec3f {
  var tuple = tuple0;
  tuple.g *= hsluv_maxSafeChromaForL(tuple.b) * .01;
  return tuple.bgr;
}

fn lchToHpluv(tuple0: vec3f) -> vec3f {
  var tuple = tuple0;
  tuple.g /= hsluv_maxSafeChromaForL(tuple.r) * .01;
  return tuple.bgr;
}

fn lchToRgb(tuple: vec3f) -> vec3f {
  return xyzToRgb(luvToXyz(lchToLuv(tuple)));
}

fn rgbToLch(tuple: vec3f) -> vec3f {
  return luvToLch(xyzToLuv(rgbToXyz(tuple)));
}

/// based on 360,100,100
fn hsluvToRgb(tuple: vec3f) -> vec3f {
  return lchToRgb(hsluvToLch(tuple));
}

fn rgbToHsluv(tuple: vec3f) -> vec3f {
  return lchToHsluv(rgbToLch(tuple));
}

fn hpluvToRgb(tuple: vec3f) -> vec3f {
  return lchToRgb(hpluvToLch(tuple));
}

fn rgbToHpluv(tuple: vec3f) -> vec3f {
  return lchToHpluv(rgbToLch(tuple));
}

fn luvToRgb(tuple: vec3f) -> vec3f {
  return xyzToRgb(luvToXyz(tuple));
}