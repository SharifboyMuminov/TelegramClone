import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/home/home_state.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/repositories/home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeState.initial());

  final HomeRepository _homeRepository;

  // Future<void> fetchUsers() async {
  //   emit(state.copyWith(formsStatus: FormsStatus.loading));
  //
  //   NetworkResponse networkResponse = await _homeRepository.getUsers();
  //
  //   if (networkResponse.errorText.isEmpty) {
  //     emit(
  //       state.copyWith(
  //         formsStatus: FormsStatus.success,
  //         users: networkResponse.data,
  //       ),
  //     );
  //   } else {
  //     setStateError(networkResponse.errorText);
  //   }
  // }

  Future<void> fetchUsers() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    _homeRepository.userStream().listen(
      (response) {
        emit(
          state.copyWith(
            users: response,
            formsStatus: FormsStatus.success,
          ),
        );
      },
      onError: (error) {
        setStateError(error.toString());
      },
    );
  }

  void setStateError(String error) {
    emit(state.copyWith(formsStatus: FormsStatus.error, errorText: error));
  }
}
