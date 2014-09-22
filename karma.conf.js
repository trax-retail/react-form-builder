webpack = require('webpack');

module.exports = function(config) {
  config.set({

    files: ['test/**'],
    hostname:'localhost',

    preprocessors: { 'test/**': ['webpack'] },

    webpack: {
      cache: true,
      resolve: {
        extensions: ['', '.js', '.jsx']
      },
      module: {
        loaders: [
          { test: /\.jsx$/, loader: 'jsx' },
          { test: /\.json$/, loader: "json" }
        ]
      },
      plugins: [
        new webpack.ProvidePlugin({
            _: "lodash",
            moment: "moment",
            accounting: "accounting",
            React: "react/addons"
        })
      ],

      webpackServer: {
        stats: {
          colors: true
        }
      },

      webpackPort: 1234,
    },

    plugins: [
     require("karma-webpack"),
     require("karma-jasmine"),
     require("karma-chrome-launcher")
    ],
    // # base path, that will be used to resolve files and exclude

    // # testing framework to use (jasmine/mocha/qunit/...)
    frameworks: ['jasmine'],

    // # list of files / patterns to exclude
    exclude: [],

    // # web server port
    port: 9876,

    // # level of logging
    // # possible values: DISABLE || ERROR || WARN || INFO || DEBUG
    logLevel: 'INFO',

    // # Start these browsers, currently available:
    // # - Chrome
    // # - ChromeCanary
    // # - Firefox
    // # - Opera
    // # - Safari (only Mac)
    // # - PhantomJS
    // # - IE (only Windows)
    browsers: [process.env.KARMA_BROWSER || "Chrome"],

  });
};

