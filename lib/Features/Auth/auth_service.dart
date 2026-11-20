
import 'package:news_app/core/Config/app_keys_config.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service.dart';

class AuthService {
  Future<bool> isLogin({
    required String email,
    required String password,
  }) async {
    String? userEmail = PreferencesManager().getString(
      key: AppKeysConfig.userEmailKey,
    );
    String? userPassword = PreferencesManager().getString(
      key: AppKeysConfig.userPasswordKey,
    );

    if (userEmail == null || userPassword == null) {
      return false;
    }

    return userEmail == email && userPassword == password;
  }

  bool isSaved() {
    String? userEmail = PreferencesManager().getString(
      key: AppKeysConfig.userEmailKey,
    );
    String? userPassword = PreferencesManager().getString(
      key: AppKeysConfig.userPasswordKey,
    );

    if (userEmail == null || userPassword == null) {
      return false;
    }

    return PreferencesManager().getBool(key: AppKeysConfig.userIsLoginedKey) ??
        false;
  }
}
