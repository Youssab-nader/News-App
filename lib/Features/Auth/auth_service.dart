import 'dart:convert';

import 'package:news_app/core/Config/app_keys_config.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service%20copy.dart';
import 'package:news_app/core/Models/user_model%20copy.dart';

class AuthService {
  Future<bool> isLogin({
    required String email,
    required String password,
  }) async {
    String? userData = PreferencesManager().getString(
      key: AppKeysConfig.userDataKey,
    );

    if (userData == null) {
      return false;
    }

    User savedUser = User.fromJson(jsonDecode(userData));

    return savedUser.email == email && savedUser.passWord == password;
  }

  bool isSaved()  {
    String? userData = PreferencesManager().getString(
      key: AppKeysConfig.userDataKey,
    );

    if(userData == null){
   return false;
 }

    User savedUser = User.fromJson(jsonDecode(userData));

    return savedUser.isLogined;
  }
}
