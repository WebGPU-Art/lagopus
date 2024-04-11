
#import lagopus::perspective

@group(1) @binding(0) var mySampler : sampler;
@group(1) @binding(1) var myTexture : texture_2d<f32>;

// main

struct VertexOut {
  @builtin(position) position: vec4f,
  @location(0) uv: vec2f,
};

@vertex
fn vertex_main(
  @builtin(vertex_index) idx: u32, @location(0) position: vec4f,
  @location(1) uv: vec2f
) -> VertexOut {
  var output: VertexOut;
  let p = transform_perspective(position.xyz).point_position;
  let scale: f32 = 0.002;

  output.position = vec4(p[0] * scale, p[1] * scale, p[2] * scale, 1.0);
  output.uv = vec2f(uv.x, 1. - uv.y);
  return output;
}

const PI = 3.14159265358532374;

fn square(x: f32) -> f32 {
  return x * x;
}

fn product(a: vec2f, b: vec2f) -> vec2f {
  return vec2f(a.x * b.x - a.y * b.y, a.x * b.y + a.y * b.x);
}

fn conjugate(a: vec2f) -> vec2f {
  return vec2f(a.x, - a.y);
}

fn divide(a: vec2f, b: vec2f) -> vec2f {
  return vec2f(((a.x * b.x + a.y * b.y) / (b.x * b.x + b.y * b.y)), ((a.y * b.x - a.x * b.y) / (b.x * b.x + b.y * b.y)));
}

fn perpendicular(p: vec2f, p1: vec2f, p2: vec2f) -> vec2f {
  let x = p.x;
  let y = p.y;
  let a = p1.x;
  let b = p1.y;
  let c = p2.x;
  let d = p2.y;
    // corrected with https://blog.csdn.net/qq_32867925/article/details/114294753
  let k = - ((a - x) * (c - a) + (b - y) * (d - b)) / (square(a - c) + square(b - d));
  return vec2f(
    a + (c - a) * k,
    b + (d - b) * k
  );
}

fn is_outside_line(p: vec2f, p1: vec2f, p2: vec2f) -> bool {
  let perp = perpendicular(p, p1, p2);
  let l = length(perp);
  return product(p, conjugate(perp)).x / (l * l) > 1.0;
}

fn rotate_by_radian(p: vec2f, a: f32) -> vec2f {
  let rot = vec2(cos(a), sin(a));
  return product(p, rot);
}

fn reflection_line(p: vec2f, p1: vec2f, p2: vec2f, skip: f32, regress: f32) -> vec2f {
  let perp = perpendicular(p, p1, p2);
  let d = perp - p;
  let ld = length(d);
  return perp + (d + (-skip * d / ld)) * regress;
}


@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  var debug = false;

  // return vec4f(1., 1., 0.7, 2.) - textureSample(myTexture, mySampler, vtx_out.uv);

    // divide circle by 6 segments
  let parts = 5.;

    // radius of the circle containing the shape
  let radius = 0.2;
  let unit = 2.0 * PI / parts;
  let spin = 0.0;

  var color_point = vtx_out.uv - 0.5;
  let shape_spin = 0.0;
  let move_x = 0.0;
  let scale = 1.0;
  let shift = vec2(0., 0.);

  color_point = product(color_point, vec2f(cos(-shape_spin), sin(-shape_spin)));
  color_point = color_point - vec2f(move_x / 400.0, 0.);

  // if abs(color_point.x) < 0.0024 {
  //   debug = true;
  // }
  // if abs(color_point.y) < 0.004 {
  //   debug = true;
  // }

  // let default_color = textureSample(myTexture, mySampler, fract(color_point - shift));
  for (var i = 0u; i < 4u; i++) {
    let point_angle = atan2(color_point.y, color_point.x);
    let at_part = floor(point_angle / unit);
    let p1 = vec2(cos(at_part * unit), sin(at_part * unit)) * radius;

    let p2 = vec2(cos((at_part + 1.0) * unit), sin((at_part + 1.0) * unit)) * radius;

    // if length(color_point - p1) < 0.1 {
    //   debug = true;
    //   break;
    // }
    // if length(color_point - p2) < 0.04 {
    //   debug = true;
    //   break;
    // }

    let perp = perpendicular(color_point, p1, p2);
    // if distance(vtx_out.uv, perp) < 0.02 {
    //   return vec4(1.0, 0.0, 0.0, 1.0);
    // }

    // if distance(vtx_out.uv, p1) < 0.02 {
    //   return vec4(0.0, 1.0, 0.0, 1.0);
    // }
    // if distance(vtx_out.uv, p2) < 0.02 {
    //   return vec4(0.0, 1.0, 0.0, 1.0);
    // }


    if is_outside_line(color_point, p1, p2) {
      // debug = true;
      color_point = reflection_line(color_point, p1, p2, 0.0, 1.0);
      // gl_FragColor = vec4(0.0, 0.0, 1.0, 1.0);
      // return;
      continue;
    } else {
      // if (fract(at_part * 0.5) < 0.5) {
      let spin_rot = vec2(cos(spin), sin(spin));
      color_point = product((color_point / scale), spin_rot);
      break;

      // } else {
      //     gl_FragColor = texture2D(color2Texture, fract((color_point - shift) * scale));
      // }
    }
  }
  let color = textureSample(myTexture, mySampler, color_point - shift + vec2f(0.5, 0.5));
  if debug {
    return vec4(1.0, 1.0, 0.0, 1.0);
  } else {
    return color;
  }
}
