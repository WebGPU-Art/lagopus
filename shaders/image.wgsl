
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

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  return textureSample(myTexture, mySampler, vtx_out.uv);
}
