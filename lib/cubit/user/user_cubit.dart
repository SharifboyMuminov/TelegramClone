import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telegramclone/cubit/user/user_state.dart';
import 'package:telegramclone/data/enums/forms_status.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/data/repositories/image_upload_repository.dart';
import 'package:telegramclone/data/repositories/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._userRepository,
    this._imageUploadRepository,
  ) : super(UserState.initial());

  final UserRepository _userRepository;
  final ImageUploadRepository _imageUploadRepository;

  Future<void> fetchUser() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await _userRepository.getUser();

    if (networkResponse.errorText.isEmpty) {
      UserModel userModel = networkResponse.data;
      updateUserFild(userModel: userModel.copyWith(isOnline: true));
    } else {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.unauthenticated,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> setActiveProfile([bool isActiveUser = false]) async {
    updateUserFild(userModel: state.userModel.copyWith(isOnline: isActiveUser));
  }

  Future<void> uploadImage({
    required File file,
    required String fileName,
  }) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));
    if (state.userModel.imagePath.isNotEmpty) {
      await _deleteImage();
    }

    NetworkResponse networkResponse = await _imageUploadRepository.uploadImage(
      file: file,
      fileName: fileName,
    );

    if (networkResponse.errorText.isEmpty) {
      updateUserFild(
          userModel: state.userModel.copyWith(
        imageUrl: networkResponse.data,
        imagePath: fileName,
      ));
    } else {
      setStateError(networkResponse.errorText);
    }
  }

  Future<void> updateUserFild(
      {required UserModel userModel, String message = ""}) async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse =
        await _userRepository.updateFiled(userModel: userModel);
    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formsStatus: FormsStatus.success,
          userModel: networkResponse.data,
          statusMessage: message,
        ),
      );
    } else {
      setStateError(networkResponse.errorText);
    }
  }

  Future<void> _deleteImage() async {
    emit(state.copyWith(formsStatus: FormsStatus.loading));

    NetworkResponse networkResponse = await _imageUploadRepository.deleteImage(
        pathImage: state.userModel.imagePath);

    if (networkResponse.errorText.isNotEmpty) {
      setStateError(networkResponse.errorText);
    }
  }

  void setStateError(String error) {
    emit(state.copyWith(formsStatus: FormsStatus.error, errorText: error));
  }
}
