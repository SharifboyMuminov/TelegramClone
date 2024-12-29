import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/auth/auth_state.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthState.initial());

  final AuthRepository _authRepository;

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await _authRepository.loginUser(
      userName: userName,
      password: password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(formsStatus: FormsStatus.authenticated));
    } else {
      setStateError(networkResponse.errorText);
    }
  }

  Future<void> register({
    required String userName,
    required String password,
  }) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await _authRepository.registerUser(
      userName: userName,
      password: password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(formsStatus: FormsStatus.authenticated));
    } else {
      setStateError(networkResponse.errorText);
    }
  }

  void setStateError(String error) {
    emit(state.copyWith(formsStatus: FormsStatus.error, errorText: error));
  }
}
