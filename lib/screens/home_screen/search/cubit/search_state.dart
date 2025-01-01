import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/user_model.dart';

class SearchState {
  final FormsStatus formsStatus;
  final String statusMessage;
  final String errorText;
  final List<UserModel> users;

  SearchState({
    required this.formsStatus,
    required this.statusMessage,
    required this.errorText,
    required this.users,
  });

  SearchState copyWith({
    FormsStatus? formsStatus,
    String? statusMessage,
    String? errorText,
    List<UserModel>? users,
  }) {
    return SearchState(
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? "",
      errorText: errorText ?? this.errorText,
      users: users ?? this.users,
    );
  }

  factory SearchState.initial() {
    return SearchState(
      formsStatus: FormsStatus.pure,
      statusMessage: "",
      errorText: "",
      users: [],
    );
  }
}
