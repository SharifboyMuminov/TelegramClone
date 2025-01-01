import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/utils/app_extension.dart';

class SearchRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResponse> searchUsers({
    required String userName,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      var result = await _firebaseFirestore
          .collection("users")
          .where("user_name", isEqualTo: "@$userName")
          .get();

      List<UserModel> userModels =
          result.docs.map((value) => UserModel.fromJson(value.data())).toList();

      networkResponse.data = userModels;
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
