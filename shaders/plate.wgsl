
struct UBO {
  cone_back_scale: f32,
  viewport_ratio: f32,
  look_distance: f32,
  forward: vec3<f32>,
  // direction up overhead, better unit vector
  upward: vec3<f32>,
  rightward: vec3<f32>,
  camera_position: vec3<f32>,
  _pad: u32,

  // custom
  color: vec3<f32>,
  chromatism: f32
};

@group(0) @binding(0)
var<uniform> uniforms: UBO;

{{perspective}}

{{rand}}

{{colors}}

// main

struct VertexOut {
  @builtin(position) position: vec4<f32>,
  @location(0) idx: f32,
  @location(1) color: vec3<f32>,
  @location(2) chromatism: f32,
};

// const PI = 3.14159265358979323846264338327950288;

@vertex
fn vertex_main(
  @location(0) position: vec3<f32>,
  @location(1) idx: u32,
) -> VertexOut {
  var output: VertexOut;

  let p = transform_perspective(position.xyz).point_position;
  let scale: f32 = 0.002;
  output.position = vec4(p[0]*scale, p[1]*scale, p[2]*scale, 1.0);
  output.idx = f32(idx);
  output.color = uniforms.color;
  output.chromatism = uniforms.chromatism;
  return output;
}

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4<f32> {
  let a = rand(vtx_out.idx);
  let color = hsl(vtx_out.color.x, vtx_out.color.y, vtx_out.color.z + a*vtx_out.chromatism);
  return vec4(color.xyz, 1.0);
}