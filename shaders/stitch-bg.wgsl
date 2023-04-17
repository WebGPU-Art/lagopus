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

{{colors}}

struct VertexOut {
  @builtin(position) position: vec4f,
};

@vertex
fn vertex_main(
  @location(0) base: vec3f,
  @location(1) position: vec3f,
) -> @builtin(position) vec4f {
  let p1 = base + uniforms.rightward * position.x + uniforms.upward * position.y;
  let p = transform_perspective(p1.xyz).point_position;
  let scale: f32 = 0.002;
  return vec4(p[0]*scale, p[1]*scale, p[2]*scale, 1.0);
}

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  return vec4(hsl(0.04, 1.0, 0.6), 0.3);
}
