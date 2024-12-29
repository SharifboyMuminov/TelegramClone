import 'package:telegramclone/utils/app_reg_exp.dart';

mixin AuthMixin {
  bool checkInput(String userName, String password) {
    return AppRegExp.passwordRegExp.hasMatch(password) &&
        AppRegExp.userName.hasMatch(userName);
  }
}
