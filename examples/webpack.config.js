
module.exports = {

  entry: {'basic': './examples/basic/basic.coffee',
          'dynamic-simple': './examples/dynamic-simple/dynamic-simple.coffee',
          'form-groups': './examples/form-groups/form-groups.coffee',
          'droppable-file-select': './examples/droppable-file-select/droppable-file-select.coffee',
          'typeaheads': './examples/typeaheads/typeaheads.coffee'
          },

  output: {
    path: __dirname,
    filename: '[name].js',
    chunkFilename: '[id].chunk.js',
    sourceMapFilename: '[name].map',
    assetPath: '/',
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


  devServer: {
    contentBase: 'examples/',
    stats: {colors: true},
  },

  devtool: "eval-source-map"

};