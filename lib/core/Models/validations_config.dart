
import 'package:flutter/material.dart';
import 'package:news_app/core/Models/user_model%20copy.dart';
import 'package:news_app/core/Models/validation_massages.dart';

class ValidationsConfig {
 User? newUser ;


  
  
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static final RegExp _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$',
  );

  static String? passwordValidation(String? input) {
    if (input == null || input.isEmpty) {
      return ValidationMessages.passwordRequired;
    } else if (!_passwordRegex.hasMatch(input)) {
      return ValidationMessages.passwordWeak;
    }
    return null;
  }

    static String? emailValidation(String? input) {
    if (input == null || input.isEmpty) {
      return ValidationMessages.emailRequired;
    } else if (!_emailRegex.hasMatch(input)) {
      return ValidationMessages.invalidEmail;
    }
    return null;
  }

  static String? Function(String?) confirmPasswordValidation({required TextEditingController passwordController}) {
    return (input) {
      if (input == null || input.isEmpty) {
        return ValidationMessages.confirmPasswordRequired;
      }

      if (input.trim() != passwordController.text.trim()) {
        return ValidationMessages.passwordNotMatch;
      }

      return null;
    };
  }
}
