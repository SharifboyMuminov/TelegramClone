import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegramclone/data/local/storage_repository.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/data/models/user_model.dart';
import 'package:telegramclone/utils/app_extension.dart';

class HomeRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResponse> getUsers() async {
    NetworkResponse networkResponse = NetworkResponse();
    String userName = StorageRepository.getString(key: "user_name");
    try {
      var result = await _firebaseFirestore
          .collection("users")
          .where("user_name", isNotEqualTo: "@$userName")
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

  Stream<List<UserModel>> userStream() {
    String userName = StorageRepository.getString(key: "user_name");

    try {
      return _firebaseFirestore
          .collection("users")
          .where("user_name", isNotEqualTo: "@$userName")
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => UserModel.fromJson(doc.data()),
                )
                .toList(),
          );
    } on FirebaseException catch (e) {
      log(e.friendlyMessage);

      return Stream.error("Firebase xatoligi: ${e.friendlyMessage}");
    } catch (e) {
      log("Noma'lum xatolik: catch (e) ");

      // Boshqa umumiy xatoliklarni streamda qaytaramiz.
      return Stream.error("Noma'lum xatolik: $e");
    }
  }
}
