import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegramclone/data/local/storage_repository.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/utils/app_extension.dart';

class AuthRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResponse> loginUser({
    required String userName,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      var result = await _firebaseFirestore
          .collection("users")
          .where("user_name", isEqualTo: "@$userName")
          .where("password", isEqualTo: password)
          .get();

      List<UserModel> userModels =
          result.docs.map((value) => UserModel.fromJson(value.data())).toList();

      if (userModels.isNotEmpty) {
        StorageRepository.setString(key: "user_name", value: userName);
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

  Future<NetworkResponse> registerUser({
    required String userName,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    networkResponse = await _checkUser(userName: userName);
    if (networkResponse.data != null) {
      networkResponse.errorText = "Bunday foydalanuvchi mavjud.";
      return networkResponse;
    }
    networkResponse = NetworkResponse();
    try {
      var res = await _firebaseFirestore.collection("users").add({
        "user_name": "@$userName",
        "password": password,
      });

      await _firebaseFirestore
          .collection("users")
          .doc(res.id)
          .update({"id": res.id});

      StorageRepository.setString(key: "user_name", value: userName);
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
          .where("user_name", isEqualTo: "@$userName")
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
