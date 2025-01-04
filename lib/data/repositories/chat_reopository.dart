import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telegramclone/data/models/message_model.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/utils/app_extension.dart';

class ChatRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResponse> sendMessage({
    required MessageModel messageModel,
    required String myDocId,
    required String docId,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    String doc = "";

    if (myDocId.codeUnits.first > docId.codeUnits.first) {
      doc = "${myDocId}_$docId";
    } else {
      doc = "${docId}_$myDocId";
    }

    try {
      var cf = await _firebaseFirestore
          .collection("message")
          .doc(doc)
          .collection("chat_room")
          .add(messageModel.toJson());

      await _firebaseFirestore
          .collection("message")
          .doc(doc)
          .collection("chat_room")
          .doc(cf.id)
          .update({"message_id": cf.id});
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
