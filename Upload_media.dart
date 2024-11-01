import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadWritingImage(File image, String uid) async {
    try {
      await _storage.ref('writings/$uid/${DateTime.now()}.png').putFile(image);
    } catch (e) {
      print(e);
    }
  }
}
