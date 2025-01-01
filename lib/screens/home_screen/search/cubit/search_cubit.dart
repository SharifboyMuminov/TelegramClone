import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/repositories/search_repository.dart';
import 'package:telegramclone/screens/home_screen/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepository) : super(SearchState.initial());

  final SearchRepository _searchRepository;

  Future<void> searchUsers({required String userName}) async {
    if (userName.isEmpty) {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          users: [],
        ),
      );

      return;
    }

    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse =
        await _searchRepository.searchUsers(userName: userName);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          users: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
