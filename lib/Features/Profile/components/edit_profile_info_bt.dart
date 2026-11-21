import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/Components/text_field_widget.dart';
import 'package:news_app/core/Config/app_keys_config.dart';
import 'package:news_app/core/Data/Local_data/local_storage_service.dart';
import 'package:news_app/core/Models/validations_config.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';

class EditProfileInfoBootmSheet extends StatefulWidget {
  const EditProfileInfoBootmSheet({super.key});

  @override
  State<EditProfileInfoBootmSheet> createState() =>
      _EditProfileInfoBootmSheetState();
}

class _EditProfileInfoBootmSheetState extends State<EditProfileInfoBootmSheet> {
  final TextEditingController nameEditingController = TextEditingController();

  final TextEditingController emailEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    nameEditingController.text =
        PreferencesManager().getString(key: AppKeysConfig.userNameKey) ?? '';
    emailEditingController.text =
        PreferencesManager().getString(key: AppKeysConfig.userEmailKey) ?? '';
    print('Name ${nameEditingController.text}');
    print('Email ${emailEditingController.text}');
  }

  void _saveData() async {
    if ((_formKey.currentState?.validate() ?? false)) {
      await PreferencesManager().setString(
        key: AppKeysConfig.userNameKey,
        value: nameEditingController.text,
      );
      await PreferencesManager().setString(
        key: AppKeysConfig.userEmailKey,
        value: emailEditingController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: SizedBox(
                width: 343.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HightSpacing(hight: 16),
                    Center(
                      child: SvgPicture.asset('assets/Icons/drag_handle.svg'),
                    ),
                    HightSpacing(hight: 24),
                    Text('Profile Info', style: AppTextStyles.primaryStyle),
                    HightSpacing(hight: 8),
                    TextFieldWidget(
                      textController: nameEditingController,
                      validationString: ValidationsConfig.nameValidation,
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                    TextFieldWidget(
                      textController: emailEditingController,
                      validationString: ValidationsConfig.emailValidation,
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                    HightSpacing(hight: 24),
                    ElevatedButton(
                      onPressed: () {
                        _saveData();
                        Navigator.pop(context);
                      },
                      child: Text('Save', style: AppTextStyles.buttonText),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
