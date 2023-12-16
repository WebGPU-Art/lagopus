
#import lagopus::perspective

#import lagopus::rand

// main

struct VertexOut {
  @builtin(position) position: vec4f,
  @location(0) color: vec3f,
};

const PI = 3.14159265358979323846264338327950288;

@vertex
fn vertex_main(
  @location(0) base: vec3f,
  @location(1) color: vec3f,
  @location(2) radius: f32,
  @location(3) vertex_count: u32,
  @location(4) angle_idx: u32,
  @location(5) shift: f32,
  @location(6) spot_idx: u32,
) -> VertexOut {
  var output: VertexOut;

  let seed = 34.26471 * f32(spot_idx * 10u) * 10.0;
  let angle_unit = 2.0 * PI / f32(vertex_count);
  let angle = f32(angle_idx) * angle_unit;
  let shift3 = vec3f(
    shift * rand_balanced(base.x + 1.29 + seed),
    shift * rand_balanced(base.y + 5.43 + seed),
    shift * rand_balanced(base.z + 3.42 + seed)
  );
  let p1 = base + shift3 + uniforms.rightward * radius * cos(angle) + uniforms.upward * radius * sin(angle);

  let p = transform_perspective(p1.xyz).point_position;
  let scale: f32 = 0.002;
  output.position = vec4(p[0] * scale, p[1] * scale, p[2] * scale, 1.0);
  output.color = color;
  return output;
}

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  return vec4(vtx_out.color, 1.0);
}
