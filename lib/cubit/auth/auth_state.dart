import 'package:telegramclone/data/enums/forms_status.dart';

class AuthState {
  final FormsStatus formsStatus;
  final String statusMessage;
  final String errorText;

  AuthState({
    required this.formsStatus,
    required this.statusMessage,
    required this.errorText,
  });

  AuthState copyWith({
    FormsStatus? formsStatus,
    String? statusMessage,
    String? errorText,
  }) {
    return AuthState(
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? "",
      errorText: errorText ?? this.errorText,
    );
  }

  factory AuthState.initial() {
    return AuthState(
      formsStatus: FormsStatus.pure,
      statusMessage: "",
      errorText: "",
    );
  }
}
