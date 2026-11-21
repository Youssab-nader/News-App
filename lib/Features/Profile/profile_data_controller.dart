import 'dart:io';

import 'package:country_picker/country_picker.dart';
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

  String? userLanguage;
  String? userCountry;

  final ImagePicker _picker = ImagePicker();

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
    userCountry =
        PreferencesManager().getString(key: AppKeysConfig.userCountryNameKey) ??
        'Country';
    notifyListeners();
  }

  void saveUserCountry(Country selectedCountry) async {
    await PreferencesManager().setString(
      key: AppKeysConfig.userCountryNameKey,
      value: selectedCountry.name,
    );
    userCountry = selectedCountry.name;

    notifyListeners();
  }

  Future<void> pickProfileImage() async {
    if (isPickingImage) return;

    isPickingImage = true;
    notifyListeners();

    try {
      final XFile? pickedImage = await _picker.pickImage(
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
