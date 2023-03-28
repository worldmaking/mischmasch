const path = require('path');
// these settings are necessary to run webassembly, needed by Automerge
module.exports = {
  experiments: { asyncWebAssembly: true },
  target: 'web',
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
  mode: "development", // or production
  performance: {       // we dont want the wasm blob to generate warnings
     hints: false,
     maxEntrypointSize: 512000,
     maxAssetSize: 512000
  }
};