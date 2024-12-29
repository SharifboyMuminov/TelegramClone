sealed class AppRegExp {
  static RegExp passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  static RegExp userName = RegExp(r'^[^ @]+$');
}
