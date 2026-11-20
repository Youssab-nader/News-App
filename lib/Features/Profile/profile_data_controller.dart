import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/core/Config/app_keys_config.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service.dart';

class ProfileDataController extends ChangeNotifier {
  String? userName;

  String? userEmail = PreferencesManager().getString(
    key: AppKeysConfig.userEmailKey,
  );

  final String? lastUserProfileImagePath = PreferencesManager().getString(
    key: AppKeysConfig.userProfileImageKey,
  );

  File? userProfileImage;

  bool isPickingImage = false;

  final String? userLanguage = null;
  final String? userCountry = null;

  final ImagePicker picker = ImagePicker();

  ProfileDataController() {
    if (lastUserProfileImagePath != null) {
      userProfileImage = File(lastUserProfileImagePath!);
    }
    getUserData();
  }

  void getUserData() {
    userName =
        PreferencesManager().getString(key: AppKeysConfig.userNameKey) ??
        'User Name';
    userEmail =
        PreferencesManager().getString(key: AppKeysConfig.userEmailKey) ??
        'Email';
    notifyListeners();
  }

  Future<void> pickProfileImage() async {
    if (isPickingImage) return;

    isPickingImage = true;
    notifyListeners();

    try {
      final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage == null) return;

      await PreferencesManager().setString(
        key: AppKeysConfig.userProfileImageKey,
        value: pickedImage.path,
      );

      userProfileImage = File(pickedImage.path);
    } finally {
      isPickingImage = false;
      notifyListeners();
    }
  }
}
