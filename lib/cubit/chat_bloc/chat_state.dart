import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/message_model.dart';

class ChatState {
  final FormsStatus formsStatus;
  final String statusMessage;
  final String errorText;
  final List<MessageModel> messages;

  ChatState({
    required this.formsStatus,
    required this.statusMessage,
    required this.errorText,
    required this.messages,
  });

  ChatState copyWith({
    FormsStatus? formsStatus,
    String? statusMessage,
    String? errorText,
    List<MessageModel>? messages,
  }) {
    return ChatState(
      formsStatus: formsStatus ?? this.formsStatus,
      statusMessage: statusMessage ?? "",
      errorText: errorText ?? this.errorText,
      messages: messages ?? this.messages,
    );
  }

  factory ChatState.initial() {
    return ChatState(
      formsStatus: FormsStatus.pure,
      statusMessage: "",
      errorText: "",
      messages: [],
    );
  }
}
