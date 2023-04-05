struct UBO {
  cone_back_scale: f32,
  viewport_ratio: f32,
  look_distance: f32,
  forward: vec3<f32>,
  // direction up overhead, better unit vector
  upward: vec3<f32>,
  rightward: vec3<f32>,
  camera_position: vec3<f32>,
};

@group(0) @binding(0)
var<uniform> uniforms: UBO;

{{perspective}}

{{simplex}}

// main

struct VertexOut {
  @builtin(position) position : vec4<f32>,
  @location(0) original: vec3<f32>,
};

@vertex
fn vertex_main(
  @location(0) position: vec3<f32>,
  @location(1) metrics: vec3<f32>,
) -> VertexOut {
  var output: VertexOut;
  let p1 = position;
  let p = transform_perspective(p1.xyz).point_position;
  let scale: f32 = 0.002;
  output.position = vec4(p[0]*scale, p[1]*scale, p[2]*scale, 1.0);
  output.original = metrics;
  return output;
}

const limit: f32 = 0.9;

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4<f32> {
  let p = vtx_out.original;
  let x_far = abs(p.x) > limit;
  let y_far = abs(p.y) > limit;
  let z_far = abs(p.z) > limit;
  let far = (x_far && y_far) || (y_far && z_far) || (z_far && x_far);
  if (far) {
    return vec4<f32>(1.0, 1.0, 1.0, 1.0);
  } else {
    return vec4<f32>(0.6, 0.6, 0.6, 1.0);
  }
}