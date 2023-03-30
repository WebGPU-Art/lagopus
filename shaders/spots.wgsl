struct UBO {
  coneBackScale: f32,
  viewportRatio: f32,
  lookDistance: f32,
  forward: vec3<f32>,
  // direction up overhead, better unit vector
  upward: vec3<f32>,
  rightward: vec3<f32>,
  cameraPosition: vec3<f32>,
};

@group(0) @binding(0)
var<uniform> uniforms: UBO;

{{perspective}}

{{simplex}}

// main

struct VertexOut {
  @builtin(position) position : vec4<f32>,
  @location(0) color: vec3<f32>,
};

const PI = 3.14159265358979323846264338327950288;

@vertex
fn vertex_main(
    @location(0) base: vec3<f32>,
    @location(1) color: vec3<f32>,
    @location(2) radius: f32,
    @location(3) vertex_count: u32,
    @location(4) idx: u32,
) -> VertexOut {
  var output: VertexOut;

  let angle_unit = 2.0 * PI / f32(vertex_count);
  let angle = f32(idx) * angle_unit;
  let p1 = base + uniforms.rightward * radius * cos(angle) + uniforms.upward * radius * sin(angle);

  let p = transform_perspective(p1.xyz).pointPosition;
  let scale: f32 = 0.002;
  output.position = vec4(p[0]*scale, p[1]*scale, p[2]*scale, 1.0);
  output.color = color;
  return output;
}

@fragment
fn fragment_main(out: VertexOut) -> @location(0) vec4<f32> {
  return vec4(out.color,1.0);
}
