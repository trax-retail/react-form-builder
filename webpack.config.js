// var webpack = require("webpack");

module.exports = {
  entry: ['./index.js'],

  output: {
    path: __dirname + "/dist/",
    library: 'react-form-builder',
    libraryTarget: 'umd',
    filename: 'react-form-builder.js'
  },

  resolve: {
    extensions: ['', '.js', '.jsx']
  },

  module: {
    loaders: [
      { test: /\.jsx$/, loader: 'jsx' },
    ]
  },


  // plugins: [
  //   new webpack.ProvidePlugin({
  //       _: "underscore",
  //   })
  // ],

  // devtool: "eval-source-map"
  devtool: "source-map"

};