//! From https://gist.github.com/munrocket/236ed5ba7e409b8bdf1ff6eca5dcdc39

fn rand(n: f32) -> f32 { return fract(sin(n) * 43758.5453123); }

fn rand_balanced(n: f32) -> f32 { return rand(n) - 0.5; }

fn noise(p: f32) -> f32 {
  let fl = floor(p);
  let fc = fract(p);
  return mix(rand(fl), rand(fl + 1.), fc);
}

fn rand2(n: vec2<f32>) -> f32 {
  return fract(sin(dot(n, vec2<f32>(12.9898, 4.1414))) * 43758.5453);
}

fn noise2(n: vec2<f32>) -> f32 {
  let d = vec2<f32>(0., 1.);
  let b = floor(n);
  let f = smoothstep(vec2<f32>(0.), vec2<f32>(1.), fract(n));
  return mix(mix(rand2(b), rand2(b + d.yx), f.x), mix(rand2(b + d.xy), rand2(b + d.yy), f.x), f.y);
}
