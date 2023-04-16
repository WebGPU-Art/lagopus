
// rotate around `axis` by angle `rot`
// need to notice the direction of rotation, and the axis passes through origin point
fn rotate_around(v: vec3f, axis: vec3f, rot: f32) -> vec3f {
  var x = v.x;
  var y = v.y;
  var z = v.z;
  var a = axis.x;
  var b = axis.y;
  var c = axis.z;
  var r = (a * x + b * y + c * z) / (a * a + b * b + c * c);
  var perpendicular = vec3f(a * r, b * r, c * r);

  var x_of_rot = v - perpendicular;
  if (length(x_of_rot) < 0.00001) {
    return v;
  }

  var y_of_rot_direction = cross(x_of_rot, axis);
  var y_scale = length(x_of_rot) / length(y_of_rot_direction);
  var y_of_rot = y_of_rot_direction * y_scale;
  var ret = x_of_rot * cos(rot) + y_of_rot * sin(rot) + perpendicular;

  return ret;
}
