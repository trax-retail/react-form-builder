
module.exports = {

  entry: ['./examples/examples.js'],

  output: {
    path: __dirname,
    library: 'react-form-builder',
    libraryTarget: 'umd',
    filename: 'examples.js'
  },

  resolve: {
    extensions: ['', '.js', '.jsx']
  },

  devServer: {
    contentBase: 'examples/',
    stats: {colors: true},
  },

  devtool: "eval-source-map"

};