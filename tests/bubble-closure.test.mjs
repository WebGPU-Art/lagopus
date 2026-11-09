import assert from 'node:assert/strict';
import { registerHooks } from 'node:module';
import test from 'node:test';
import { to_tag, _$L_, _$n__$M_ } from '../js-out/calcit.core.mjs';

// Observe the generated buffers before they reach the WebGPU renderer.
const renderer = `
  export const createRenderer = options => options;
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
const { comp_bubbles } = await import('../js-out/lagopus.comp.spots.mjs');
hook.deregister();

test('radius 7 produces 42 line segments and ends at one full turn', () => {
  const options = _$n__$M_(to_tag('bubbles'), _$L_(_$L_(1, 2, 3, 7)));
  const { vertices, verticesLength } = comp_bubbles(options);

  assert.equal(verticesLength, 42 * 2);
  assert.equal(vertices[2].at(-1), Math.fround(2 * Math.PI));
});
