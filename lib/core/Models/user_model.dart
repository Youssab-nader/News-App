
import 'package:news_app/core/Config/app_keys_config.dart';

class User {
  final String email;
  final String passWord;
  bool isLogined;

  User({
    required this.email,
    required this.passWord,
    this.isLogined = false,
  });

  Map<String, dynamic> toJson() {
    return {
      AppKeysConfig.userEmailKey: email,
      AppKeysConfig.userIsLoginedKey: isLogined,
      AppKeysConfig.userPasswordKey: passWord,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
     email: json[AppKeysConfig.userEmailKey],
      isLogined:json[AppKeysConfig.userIsLoginedKey],
      passWord:json[AppKeysConfig.userPasswordKey]
    );
  }

  // String getFirstName() {
  //   String firstName = '';
  //   for (int i = 0; i < name.length; i++) {
  //     if (name[i] == ' ') {
  //       break;
  //     }
  //     firstName += name[i];
  //   }

  //   return firstName;
  // }
}
