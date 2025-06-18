import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whole_sellex_selleradmin_pannel/src/features/settings/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class ProfileController with ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;
  XFile? _pickedImage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  XFile? get pickedImage => _pickedImage;

  // Fetch user data from Firebase Authentication and Firestore
  Future<void> fetchUserData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final firebaseUser = auth.FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        _error = 'No user is signed in';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();
      if (doc.exists) {
        final data = doc.data()!;
        _user = UserModel(
          userId: firebaseUser.uid,
          userName: data['userName'] ?? firebaseUser.displayName ?? '',
          userEmail: data['userEmail'] ?? firebaseUser.email ?? '',
          profilePicture: data['profilePicture'],
          bio: data['bio'],
        );
      } else {
        // Create Firestore document if it doesn't exist
        _user = UserModel(
          userId: firebaseUser.uid,
          userName: firebaseUser.displayName ?? '',
          userEmail: firebaseUser.email ?? '',
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .set({
          'userName': _user!.userName,
          'userEmail': _user!.userEmail,
          'profilePicture': _user!.profilePicture,
          'bio': _user!.bio,
        });
      }
    } catch (e) {
      _error = 'Failed to fetch user data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Pick image (web-compatible)
  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        _pickedImage = pickedImage;
        notifyListeners();
      }
    } catch (e) {
      _error = 'Failed to pick image: $e';
      notifyListeners();
    }
  }

  // Upload image to Firebase Storage
  Future<String?> uploadImageToFirebase(XFile image) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child(
            'profile_pictures/${_user!.userId}_${DateTime.now().millisecondsSinceEpoch}.jpg',
          );
      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        final uploadTask = storageRef.putData(bytes);
        final taskSnapshot = await uploadTask;
        return await taskSnapshot.ref.getDownloadURL();
      } else {
        final uploadTask = storageRef.putFile(File(image.path));
        final taskSnapshot = await uploadTask;
        return await taskSnapshot.ref.getDownloadURL();
      }
    } catch (e) {
      _error = 'Failed to upload image: $e';
      notifyListeners();
      return null;
    }
  }

  // Update profile picture
  Future<void> updateProfilePicture() async {
    if (_pickedImage == null) return;

    _isLoading = true;
    notifyListeners();

    try {
      final imageUrl = await uploadImageToFirebase(_pickedImage!);
      if (imageUrl != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.userId)
            .update({
          'profilePicture': imageUrl,
        });
        _user!.profilePicture = imageUrl;
        _pickedImage = null;
      }
    } catch (e) {
      _error = 'Failed to update profile picture: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Remove profile picture
  Future<void> removeProfilePicture() async {
    _isLoading = true;
    notifyListeners();

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.userId)
          .update({
        'profilePicture': null,
      });
      _user!.profilePicture = null;
      _pickedImage = null;
    } catch (e) {
      _error = 'Failed to remove profile picture: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update profile details (Auth and Firestore)
  Future<void> updateProfileDetails({
    required String userName,
    required String userEmail,
    String? bio,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final firebaseUser = auth.FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        _error = 'No user is signed in';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Update Firebase Authentication
      await firebaseUser.updateDisplayName(userName);
      if (firebaseUser.email != userEmail) {
        await firebaseUser
            .verifyBeforeUpdateEmail(userEmail); // Sends verification email
      }

      // Update Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .update({
        'userName': userName,
        'userEmail': userEmail,
        if (bio != null) 'bio': bio,
      });

      // Update local user model
      _user!.userName = userName;
      _user!.userEmail = userEmail;
      _user!.bio = bio;
    } catch (e) {
      _error = 'Failed to update profile details: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
