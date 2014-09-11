Validators = {

  Filename: require('./FilenameValidator'),
  Length: require('./LengthValidator'),
  NotNull: require('./NotNullValidator'),
  Numeric: require('./NumericValidator')

}
module.exports = Validators;