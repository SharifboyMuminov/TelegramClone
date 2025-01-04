import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/user_model.dart';

class HomeState {
  final FormsStatus formsStatus;
  final String statusMessage;
  final String errorText;
  final List<UserModel> users;

  HomeState({
    required this.formsStatus,
    required this.statusMessage,
    required this.errorText,
    required this.users,
  });

  HomeState copyWith({
    FormsStatus? formsStatus,
    String? statusMessage,
    String? errorText,
    List<UserModel>? users,
  }) {
    return HomeState(
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? "",
      errorText: errorText ?? this.errorText,
      users: users ?? this.users,
    );
  }

  factory HomeState.initial() {
    return HomeState(
      formsStatus: FormsStatus.pure,
      statusMessage: "",
      errorText: "",
      users: [],
    );
  }
}
