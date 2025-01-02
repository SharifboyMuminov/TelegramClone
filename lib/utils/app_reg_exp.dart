sealed class AppRegExp {
  static RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  static RegExp userNameRegExp = RegExp(r'^[^ @]+$');
  static RegExp userFulNameRegExp = RegExp(r'^[A-Z][a-z]+ [A-Z][a-z]+$');

}
