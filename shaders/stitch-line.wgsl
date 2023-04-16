struct UBO {
  cone_back_scale: f32,
  viewport_ratio: f32,
  look_distance: f32,
  forward: vec3f,
  // direction up overhead, better unit vector
  upward: vec3f,
  rightward: vec3f,
  camera_position: vec3f,
};

@group(0) @binding(0)
var<uniform> uniforms: UBO;

{{perspective}}

struct VertexOut {
  @builtin(position) position: vec4f,
  @location(0) r: f32,
  @location(1) s: f32,
  @location(2) value: f32,
};

@vertex
fn vertex_main(
  @location(0) base: vec3f,
  @location(1) position: vec3f,
  @location(2) value: u32,
) -> VertexOut {
  var p1 = base + uniforms.rightward * position.x + uniforms.upward * position.y;
  if (value == 1u) {
    p1 -= uniforms.forward * 0.1;
  }
  let result = transform_perspective(p1.xyz);
  let p = result.point_position;
  let scale: f32 = 0.002;
  var output: VertexOut;
  output.position = vec4(p * scale, 1.0);
  output.r = result.r;
  output.s = result.s;
  output.value = f32(value);
  return output;
}

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  if (vtx_out.value > 0.5) {
    return vec4(1.0, 1.0, 1.0, 1.0);
  } else {
    return vec4(1.0, 0.0, 0.0, 1.0);
  }
}
