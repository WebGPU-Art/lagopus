
#import lagopus::perspective

#import lagopus::rand

#import lagopus::colors

// main

struct VertexOut {
  @builtin(position) position: vec4f,
  @location(0) radian: f32,
  @location(1) s: f32,
};

// const PI = 3.14159265358979323846264338327950288;

@vertex
fn vertex_main(
  @location(0) position: vec3f,
  @location(1) arm: vec2f,
  @location(2) radian: f32,
) -> VertexOut {
  var output: VertexOut;
  let p1 = position + uniforms.rightward * arm.x + uniforms.upward * arm.y;
  let result = transform_perspective(p1.xyz);
  let p = result.point_position;
  let s = result.r;
  let scale: f32 = 0.002;
  output.position = vec4(p[0] * scale, p[1] * scale, p[2] * scale, 1.0);
  output.radian = radian;
  output.s = s;
  return output;
}

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  let dim = min(1., (1. / pow(vtx_out.s, 1.6)) + 0.02);
  let l = (cos(vtx_out.radian * 1.8 - 1.8) * 0.3 + 0.76);
  return vec4f(l, l, l, l * dim);
}
