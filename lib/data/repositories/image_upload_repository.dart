import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:telegramclone/data/models/network_response.dart';
import 'package:telegramclone/utils/app_extension.dart';

class ImageUploadRepository {
  final _storageRef = FirebaseStorage.instance.ref();

  Future<NetworkResponse> uploadImage({
    required File file,
    required String fileName,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    String imageUrl = "";

    try {
      final imagesRef = _storageRef.child(fileName);
      await imagesRef.putFile(file);
      imageUrl = await imagesRef.getDownloadURL();

      if (imageUrl.isNotEmpty) {
        networkResponse.data = imageUrl;
      } else {
        networkResponse.errorText = "Rasim yuklashda hatolik yuz berdi.";
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

  Future<NetworkResponse> deleteImage({
    required String pathImage,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      final imagesRef = _storageRef.child(pathImage);
      await imagesRef.delete();
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
