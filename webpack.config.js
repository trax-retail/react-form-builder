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
    extensions: ['', '.js', '.jsx', '.jsx.coffee', '.coffee']
  },

  module: {
    loaders: [
      { test: /\.jsx.coffee$/, loader: 'jsx!coffee' },
      { test: /\.coffee$/, exclude: /\.jsx.coffee$/, loader: 'coffee-loader' }
    ]
  },

  // plugins: [
  //   new webpack.ProvidePlugin({
  //       _: "lodash",
  //   })
  // ],

  // devtool: "eval-source-map"
  devtool: "source-map"

};