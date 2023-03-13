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

const ALL_HEIGHT: f32 = 100.0;

{{perspective}}

{{simplex}}

// main

struct VertexOut {
    @builtin(position) position : vec4<f32>,
    @location(1) h: f32,
};

@vertex
fn vertex_main(
    @location(0) position: vec2<f32>,
    @location(1) normal_idx: u32,
    @location(2) idx: u32,
) -> VertexOut
{
  var output: VertexOut;
  let h1 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.0002) * ALL_HEIGHT * 0.6;
  let h2 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.002) * ALL_HEIGHT * 0.25;
  let h3 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.008) * ALL_HEIGHT * 0.05;
  let h4 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.01) * ALL_HEIGHT * 0.05;
  let h5 = simplexNoise2(vec2<f32>(position.x, position.y) * 0.02) * ALL_HEIGHT * 0.05;
  let h = h1 + h2 + h3 + h4 + h5 - 30.0;
  var p1 = vec3<f32>(position.x, h, position.y);
  let d = 20.0;
  let up = h;
  switch (idx) {
    case 0u: {
      p1 += vec3<f32>(-d, 0.0, -d);
    }
    case 1u: {
      p1 += vec3<f32>(d, 0.0, -d);
    }
    case 2u: {
      p1 += vec3<f32>(d, 0.0, d);
    }
    case 3u: {
      p1 += vec3<f32>(-d, 0.0, d);
    }
    case 4u: {
      p1 += vec3<f32>(-d, up, -d);
    }
    case 5u: {
      p1 += vec3<f32>(d, up, -d);
    }
    case 6u: {
      p1 += vec3<f32>(d, up, d);
    }
    case 7u: {
      p1 += vec3<f32>(-d, up, d);
    }
    default: {
      //
    }
  }
  let p = transform_perspective(p1.xyz).pointPosition;
  let scale: f32 = 0.002;
  output.position = vec4(p[0]*scale, p[1]*scale, p[2]*scale, 1.0);
  // output.position = position;
  output.h = h;
  return output;
}

@fragment
fn fragment_main(fragData: VertexOut) -> @location(0) vec4<f32>
{
    // return fragData.color;
    // return vec4<f32>(0.0, 0.0, 1.0, 1.0);
    let h = fragData.h;
    let a = 0.7 - (h / ALL_HEIGHT * 0.4 + 0.4);
    // return vec4<f32>(1.0, 1.0, 1.0, 1.0);
    return vec4<f32>(a, a, a, 1.0);
}
