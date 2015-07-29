module.exports = cityService =
  uploadCityImage: (file, callback) ->
    callback.success?(url: "http://m.c.lnkd.licdn.com/mpr/mpr/p/4/005/052/10a/0e7ce98.jpg")
    callback.complete?(url: "http://m.c.lnkd.licdn.com/mpr/mpr/p/4/005/052/10a/0e7ce98.jpg")
