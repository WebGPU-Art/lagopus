import assert from 'node:assert/strict';
import { registerHooks } from 'node:module';
import test from 'node:test';

// The cache accepts plain JS objects without invoking the browser renderer.
const hook = registerHooks({
  resolve(specifier, context, nextResolve) {
    if (specifier === '@triadica/lagopus') {
      return { url: 'data:text/javascript,export%20{}', shortCircuit: true };
    }
    return nextResolve(specifier, context);
  },
});
const { memo_object } = await import('../js-out/lagopus.alias.mjs');
hook.deregister();

test('memo-object reuses the same JS object for the same callback', () => {
  let calls = 0;
  const make = () => ({ frame: ++calls });

  assert.strictEqual(memo_object(make), memo_object(make));
  assert.equal(calls, 1);
});
