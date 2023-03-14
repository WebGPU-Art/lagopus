// perspective

struct PointResult {
  pointPosition: vec3<f32>,
  r: f32,
  s: f32,
};

fn transform_perspective(p: vec3<f32>) -> PointResult {
  let forward = uniforms.forward;
  let upward = uniforms.upward;
  let rightward = uniforms.rightward;
  let lookDistance = uniforms.lookDistance;
  let cameraPosition = uniforms.cameraPosition;

  let moved_point: vec3<f32> = p - cameraPosition;

  let s: f32 = uniforms.coneBackScale;

  let r: f32 = dot(moved_point, forward) / lookDistance;

  if (r < (s * -0.9)) {
    // make it disappear with depth test since it's probably behind the camera
    return PointResult(vec3(0.0, 0.0, 10000.), r, s);
  }

  let screen_scale: f32 = (s + 1.0) / (r + s);
  let y_next: f32 = dot(moved_point, upward) * screen_scale;
  let x_next: f32 = dot(moved_point, rightward) * screen_scale;
  let z_next: f32 = r;

  return PointResult(
    vec3(x_next, y_next / uniforms.viewportRatio, z_next),
    r, s
  );
}