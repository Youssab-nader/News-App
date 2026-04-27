import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/Features/Home/home_screen.dart';
import 'package:news_app/core/Components/text_field_widget.dart';
import 'package:news_app/core/Config/app_keys_config.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service%20copy.dart';
import 'package:news_app/core/Models/user_model%20copy.dart';
import 'package:news_app/core/Models/validations_config.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? tempPass;
  String? errorMassage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/auth_background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HightSpacing(hight: 160),
                SvgPicture.asset('assets/Icons/logo.svg'),
                HightSpacing(hight: 34),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome to Newst',
                    style: AppTextStyles.splashTop.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),
                HightSpacing(hight: 16),
                TextFieldWidget(
                  labelText: 'Email',
                  hintText: 'user@email.com',
                  textController: _emailController,
                  validationString: ValidationsConfig.emailValidation,
                ),
                TextFieldWidget(
                  labelText: 'Password',
                  hintText: '*********',
                  textController: _passwordController,
                  validationString: ValidationsConfig.passwordValidation,
                  isPassword: true,
                  onChange: (value) {
                    tempPass = value;
                  },
                ),

                TextFieldWidget(
                  labelText: 'Confirm Passward',
                  hintText: '*********',
                  textController: _confPasswordController,
                  validationString: ValidationsConfig.confirmPasswordValidation(
                    passwordController: _passwordController,
                  ),
                  isPassword: true,
                ),
                HightSpacing(hight: 8),
                ElevatedButton(
                  onPressed: () async {
                    if ((_formKey.currentState?.validate() ?? false)) {
                      if (await signUp()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(child: Text('Sign Up Succecfuly')),
                          ),
                        );
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pushReplacement(context , MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(errorMassage ?? ' Sign up Failed'),
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Sign up', style: AppTextStyles.buttonText),
                ),
                HightSpacing(hight: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account ?',
                      style: AppTextStyles.primaryStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Sign in', style: AppTextStyles.skipText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> signUp() async {
    final User newUser = User(
      email: _emailController.text,
      passWord: _passwordController.text,
      isLogined: true,
    );
    final Map<String, dynamic> userJsonData = newUser.toJson();
    final String userDataString = jsonEncode(userJsonData);

    await PreferencesManager().setString(
      key: AppKeysConfig.userDataKey,
      value: userDataString,
    );

    return true;
    // final String? userStoredDataString = PreferencesManager().getString(
    //   key: AppKeysConfig.userDataKey,
    // );

    // Map<String, dynamic> userStoredDataJson = jsonDecode(
    //   userStoredDataString ?? '',
    // );
    // final oldUser = User.fromJson(userStoredDataJson);
    // final String savedEmail = oldUser.email;
    // if (savedEmail == _emailController.text) {
    //   errorMassage = 'The Eamil THat You Enterd is Alredy Login';
    //   return false;
    // } else {
    //   errorMassage = null;

    //   return true;
    // }
  }
}
