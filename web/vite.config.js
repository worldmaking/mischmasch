// https://vitejs.dev/config/
export default defineConfig({
  // https://github.com/vitejs/vite/issues/1973
  define: {
      // "process.env": process.env,
      // // By default, Vite doesn't include shims for NodeJS/
      // // necessary for segment analytics lib to work
      "global": {},
  },
  resolve: {
      alias: {
          
          assert: "assert",

      },
  },
  plugins: [],
});