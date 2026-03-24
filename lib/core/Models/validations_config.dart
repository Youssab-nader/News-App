import 'package:news_app/core/Models/validation_massages.dart';

class ValidationsConfig {
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$',
  );

  static String? Function(String?)? emailValidation(String? input) {
    return (String? input) {
      if (input == null || input.isEmpty) {
        return ValidationMessages.emailRequired;
      } else if (!_emailRegex.hasMatch(input)) {
        return ValidationMessages.invalidEmail;
      }
      return null;
    };
  }

  static String? Function(String?)? passwordValidation(String? input) {
    return (String? input) {
      if (input == null || input.isEmpty) {
        return ValidationMessages.passwordRequired;
      } else if (!_passwordRegex.hasMatch(input)) {
        return ValidationMessages.passwordWeak;
      }
      return null;
    };
  }

  static String? Function(String?)? confPasswordValidation({
    required String? input,
    required String? password,
  }) {
    return (String? input) {
      if (input == null || input.isEmpty) {
        return ValidationMessages.confirmPasswordRequired;
      } else if (input != password) {
        return ValidationMessages.passwordNotMatch;
      }
      return null;
    };
  }
}
