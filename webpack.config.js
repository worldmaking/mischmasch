const path = require('path');


module.exports = {
  mode: "development", // this enables source maps, making it easier to debug apps. remember you can switch to 'production' for the live app
    entry: './src/main.js',
    output: {
      filename: 'bundle.js',
      path: path.resolve(__dirname, 'dist'),
    //   clean: true

    },
    module: {
        rules: [
          {
            test: /\.css$/,
            use: [
              'style-loader',
              'css-loader'
            ]
          }
        ]
      }
};


// module.exports = {
//     entry: './src/main.js',
//     output: {
//       filename: 'bundle.js'
//     }
//   };