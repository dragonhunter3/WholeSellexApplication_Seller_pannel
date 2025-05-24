import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageController with ChangeNotifier {
  Uint8List? _selectedImage;
  String? _downloadUrl;

  Uint8List? get selectedImage => _selectedImage;
  String? get downloadUrl => _downloadUrl;

  Future<void> setImage(Uint8List? image, String fileName) async {
    if (image == null) {
      _selectedImage = null;
      _downloadUrl = null;
      notifyListeners();
      return;
    }

    _selectedImage = image;

    try {
      final storageRef =
          FirebaseStorage.instance.ref().child('product_images/$fileName');
      final uploadTask = storageRef.putData(
          image, SettableMetadata(contentType: 'image/jpeg'));
      final snapshot = await uploadTask;
      _downloadUrl = await snapshot.ref.getDownloadURL();
      notifyListeners();
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      _downloadUrl = null;
      notifyListeners();
      rethrow;
    }
  }

  void clearImage() {
    _selectedImage = null;
    _downloadUrl = null;
    notifyListeners();
  }
}
