import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/Features/Auth/sign_up_screen.dart';
import 'package:news_app/Features/Home/home_screen.dart';
import 'package:news_app/core/Components/text_field_widget.dart';
import 'package:news_app/core/Models/validations_config.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      color: AppColors.secondryText,
                    ),
                  ),
                ),
                HightSpacing(hight: 16),
                TextFieldWidget(
                  labelText: 'Email',
                  hintText: 'user@email.com',
                  textController: emailController,
                  validationString: ValidationsConfig.emailValidation(
                    emailController.text,
                  ),
                ),
                TextFieldWidget(
                  labelText: 'Password',
                  hintText: '*********',
                  textController: passwordController,
                  validationString: ValidationsConfig.passwordValidation(
                    passwordController.text,
                  ),
                  isPassword: true,
                ),
                HightSpacing(hight: 8),
                ElevatedButton(
                  onPressed: () {
                    if ((_formKey.currentState?.validate() ?? false)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: Text('Sign in', style: AppTextStyles.buttonText),
                ),
                HightSpacing(hight: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: AppTextStyles.primaryStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text('Sign up', style: AppTextStyles.skipText),
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
}
