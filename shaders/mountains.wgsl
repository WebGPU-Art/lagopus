struct UBO {
  cone_back_scale: f32,
  viewport_ratio: f32,
  look_distance: f32,
  scale: f32,
  forward: vec3f,
  // direction up overhead, better unit vector
  upward: vec3f,
  rightward: vec3f,
  camera_position: vec3f,
};

@group(0) @binding(0)
var<uniform> uniforms: UBO;

const ALL_HEIGHT: f32 = 600.0;

{{perspective}}

{{simplex}}

// main

struct VertexOut {
  @builtin(position) position: vec4f,
  @location(0) h: f32,
};

@vertex
fn vertex_main(
  @location(0) position: vec2<f32>
) -> VertexOut {
  var output: VertexOut;
  let h1 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.0002) * ALL_HEIGHT * 0.6;
  let h2 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.002) * ALL_HEIGHT * 0.25;
  let h3 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.008) * ALL_HEIGHT * 0.05;
  let h4 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.01) * ALL_HEIGHT * 0.05;
  let h5 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.02) * ALL_HEIGHT * 0.05;
  let h = h1 + h2 + h3 + h4 + h5 - 300.0;
  let p1 = vec3f(position.x, h, position.y);
  let p = transform_perspective(p1.xyz).point_position;
  let scale: f32 = 0.002;
  output.position = vec4(p[0] * scale, p[1] * scale, p[2] * scale, 1.0);
  // output.position = position;
  output.h = h;
  return output;
}

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  // return vec4f(0.0, 0.0, 1.0, 1.0);
  let h = vtx_out.h;
  let a = 0.7 - (h / ALL_HEIGHT * 0.4 + 0.4);
  // return vec4f(1.0, 1.0, 1.0, 1.0);
  return vec4f(a, a, a, 1.0);
}
