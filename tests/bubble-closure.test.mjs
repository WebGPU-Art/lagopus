import assert from 'node:assert/strict';
import { registerHooks } from 'node:module';
import test from 'node:test';
import { to_tag, _$L_, _$n__$M_ } from '../js-out/calcit.core.mjs';
import { v3 } from '../js-out/quaternion.vector.mjs';

// Observe the generated buffers before they reach the WebGPU renderer.
const renderer = `
  export const createRenderer = options => options;
  export const newBufferFormatLength = (format, length) =>
    new Float32Array(length * (format.endsWith('x3') ? 3 : 1));
  export const newBufferFormatArray = (_format, values) => Float32Array.from(values);
`;
const hook = registerHooks({
  resolve(specifier, context, nextResolve) {
    if (specifier === '@triadica/lagopus') {
      return { url: 'data:text/javascript,' + encodeURIComponent(renderer), shortCircuit: true };
    }
    return nextResolve(specifier, context);
  },
});
const { comp_bubbles, comp_spots } = await import('../js-out/lagopus.comp.spots.mjs');
const { object_writer_with } = await import('../js-out/lagopus.alias.mjs');
hook.deregister();

test('radius 7 produces 42 line segments and ends at one full turn', () => {
  const options = _$n__$M_(to_tag('bubbles'), _$L_(_$L_(1, 2, 3, 7)));
  const { vertices, verticesLength } = comp_bubbles(options);

  assert.equal(verticesLength, 42 * 2);
  assert.equal(vertices[2].at(-1), Math.fround(2 * Math.PI));
});

test('spots reuse decoded vector and list positions in every triangle', () => {
  const points = _$L_(v3(1, 2, 3), _$L_(4, 5, 6));
  const options = _$n__$M_(to_tag('points'), points, to_tag('vertex-count'), 4);
  const { vertices, verticesLength } = comp_spots(options);

  assert.equal(verticesLength, 12);
  assert.deepEqual(Array.from(vertices[0]), [
    ...Array.from({ length: 6 }, () => [1, 2, 3]).flat(),
    ...Array.from({ length: 6 }, () => [4, 5, 6]).flat(),
  ]);
});

// Exercise the streaming writer path as well as the direct geometry tests above.
test('streamed vertex attributes reach the renderer in order', () => {
  const attr = _$n__$M_(to_tag('field'), to_tag('position'), to_tag('format'), 'float32x3');
  const options = _$n__$M_(to_tag('shader'), '', to_tag('topology'), to_tag('triangle-list'), to_tag('attrs-list'), _$L_(attr));
  const result = object_writer_with(options, emit => emit(_$L_(_$L_(1, 2, 3), _$L_(4, 5, 6))), value => value);
  assert.equal(result.verticesLength, 2);
  assert.deepEqual(Array.from(result.vertices[0]), [1, 2, 3, 4, 5, 6]);
});
