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

{{perspective}}

{{colors}}

// main

struct VertexOut {
  @builtin(position) position: vec4f,
  @location(0) original: vec3f,
  @location(1) ratio: f32,
  @location(2) color: vec3f,
};

@vertex
fn vertex_main(
  @location(0) position: vec3f,
  @location(1) brush: u32,
  @location(2) direction: vec3f,
  @location(3) curve_ratio: f32,
  @location(4) color_index: u32,
  @location(5) width: f32,
) -> VertexOut {
  var output: VertexOut;

  var p1 = position;

  var next = cross(direction, uniforms.forward);
  if (length(next) < 0.0001) {
    // if parallel, use leftward
    next = -next;
  }
  let brush_direction = normalize(next);
  if (brush == 1) {
    p1 += brush_direction * width * 0.5;
  } else {
    p1 -= brush_direction * width * 0.5;
  }

  let p = transform_perspective(p1.xyz).point_position;
  let scale: f32 = 0.002;
  output.position = vec4(p[0]*scale, p[1]*scale, p[2]*scale, 1.0);
  output.original = position;
  output.ratio = curve_ratio;
  output.color = hsl(fract(0.14 + curve_ratio), 1.0, 0.2 + 0.8 * fract(0.8 + f32(color_index) * 0.01));

  return output;
}

const middle: f32 = 50.0;
const limit: f32 = 48.0;

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  // return vec4f(vtx_out.color, 1.0);
  return vec4(0.7, 0.7, 0.7, 1);
}
