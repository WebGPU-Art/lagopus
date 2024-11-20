import glsl from "vite-plugin-glsl";
import { defineConfig } from "vite";

export default defineConfig({
  plugins: [
    glsl({
      // include: /wgsl/i,
    }),
  ],
  build: {
    rollupOptions: {
      treeshake: false,
    },
  },
  optimizeDeps: {
    exclude: ["@triadica/lagopus/lib/comp/bottom.mjs", "@triadica/lagopus"],
  },
});
