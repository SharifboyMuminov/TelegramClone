import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegramclone/data/local/storage_repository.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/utils/app_extension.dart';

class UserRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResponse> getUser() async {
    NetworkResponse networkResponse = NetworkResponse();

    String userName = StorageRepository.getString(key: "user_name");

    try {
      var result = await _firebaseFirestore
          .collection("users")
          .where("user_name", isEqualTo: "@$userName")
          .get();

      List<UserModel> userModels =
          result.docs.map((value) => UserModel.fromJson(value.data())).toList();

      if (userModels.isNotEmpty) {
        networkResponse.data = userModels.first;
      } else {
        networkResponse.errorText = "user_not_found";
        log("user_not_found");
      }
    } on FirebaseException catch (e) {
      log(e.friendlyMessage);

      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      log("Noma'lum xatolik: catch (e) ");

      networkResponse.errorText = "Noma'lum xatolik: catch (e) ";
    }

    return networkResponse;
  }

  Future<NetworkResponse> updateFiled({required UserModel userModel}) async {
    NetworkResponse networkResponse = NetworkResponse();

    networkResponse = await _checkUser(userName: userModel.userName);

    if (networkResponse.data != null) {
      UserModel user = networkResponse.data;
      if (user.id != userModel.id) {
        networkResponse.data = null;
        networkResponse.errorText = "Bunday foydalanuvchi mavjud";
        return networkResponse;
      }
    }

    try {
      await _firebaseFirestore
          .collection("users")
          .doc(userModel.id)
          .update(userModel.toJson());
      networkResponse.data = userModel;
    } on FirebaseException catch (e) {
      log(e.friendlyMessage);

      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      log("Noma'lum xatolik: catch (e) ");

      networkResponse.errorText = "Noma'lum xatolik: catch (e) ";
    }
    return networkResponse;
  }

  Future<NetworkResponse> _checkUser({required String userName}) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      var result = await _firebaseFirestore
          .collection("users")
          .where("user_name", isEqualTo: userName)
          .get();

      List<UserModel> userModels =
          result.docs.map((value) => UserModel.fromJson(value.data())).toList();

      if (userModels.isNotEmpty) {
        networkResponse.data = userModels.first;
      } else {
        networkResponse.errorText = "Bunday foydalanuvchi mavjud emas";
        log("Bunday foydalanuvchi mavjud emas");
      }
    } on FirebaseException catch (e) {
      log(e.friendlyMessage);

      networkResponse.errorText = e.friendlyMessage;
    } catch (e) {
      log("Noma'lum xatolik: catch (e) ");

      networkResponse.errorText = "Noma'lum xatolik: catch (e) ";
    }
    return networkResponse;
  }
}
