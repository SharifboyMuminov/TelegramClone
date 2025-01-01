import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/user/user_state.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/repositories/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository) : super(UserState.initial());

  final UserRepository _userRepository;

  Future<void> fetchUser() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await _userRepository.getUser();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          userModel: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.unauthenticated,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  void setStateError(String error) {
    emit(state.copyWith(formsStatus: FormsStatus.error, errorText: error));
  }
}
