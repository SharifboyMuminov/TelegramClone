import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/chat_bloc/chat_state.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/message_model.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/repositories/chat_repository.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepository) : super(ChatState.initial());

  final ChatRepository _chatRepository;
  late final StreamSubscription<List<MessageModel>> _chatSubscription;

  Future<void> senMessage({
    required MessageModel messageModel,
    required String docId,
  }) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    NetworkResponse networkResponse = await _chatRepository.sendMessage(
      messageModel: messageModel,
      docId: docId,
    );

    if (networkResponse.errorText.isNotEmpty) {
      setStateError(networkResponse.errorText);
    }
  }

  Future<void> listenChatRoom({required String docId}) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    _chatSubscription = _chatRepository.listenChatRoom(docId: docId).listen(
      (response) {
        if (!isClosed) {
          emit(
            state.copyWith(
              formsStatus: FormsStatus.success,
              messages: response.reversed.toList(),
            ),
          );
        }
      },
      onError: (error) {
        setStateError(error.toString());
      },
    );
  }

  void setStateError(String error) {
    emit(state.copyWith(formsStatus: FormsStatus.error, errorText: error));
  }

  @override
  Future<void> close() {
    _chatSubscription.cancel();
    return super.close();
  }
}
