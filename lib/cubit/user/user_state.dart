import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/user_model.dart';

class UserState {
  final FormsStatus formsStatus;
  final String statusMessage;
  final String errorText;
  final UserModel userModel;

  UserState({
    required this.formsStatus,
    required this.statusMessage,
    required this.userModel,
    required this.errorText,
  });

  UserState copyWith({
    FormsStatus? formsStatus,
    String? statusMessage,
    String? errorText,
    UserModel? userModel,
  }) {
    return UserState(
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? "",
      errorText: errorText ?? this.errorText,
      userModel: userModel ?? this.userModel,
    );
  }

  factory UserState.initial() {
    return UserState(
      formsStatus: FormsStatus.pure,
      statusMessage: "",
      errorText: "",
      userModel: UserModel.initial(),
    );
  }
}
