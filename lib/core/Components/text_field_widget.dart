import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/Style/app_colors.dart';
import 'package:news_app/core/Style/app_text_styles.dart';
import 'package:news_app/core/Widgets/spacing_widget.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final String? labelIconPath;
  final String hintText;
  final TextEditingController? textController;
  String? starIcon;
  int? maxLines;
  bool isPassword;
  final String? Function(String?)? validationString;

  TextFieldWidget({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.maxLines,
    required this.hintText,
    this.starIcon,
    this.validationString,
    this.textController,
    this.labelIconPath,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool disPass = false;
  @override

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HightSpacing(hight: 3),
        Row(
          children: [
            (widget.labelIconPath != null)
                ? SvgPicture.asset(widget.labelIconPath!)
                : SizedBox(),
            Text(
              widget.labelText,
              style: AppTextStyles.primaryStyle.copyWith(
                color: AppColors.primaryText,
              ),
            ),
            Text(
              widget.starIcon ?? '',
              style: AppTextStyles.primaryStyle.copyWith(
                color: AppColors.primaryText,
              ), //TextStyle(color: Colors.red, fontSize: 15.sp),
            ),
          ],
        ),
        HightSpacing(hight: 5),
        SizedBox(
          width: 343.w,
          height: 56.h,
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: widget.textController,
            validator: widget.validationString,
            maxLines: widget.maxLines ?? 1,
            obscureText: (widget.isPassword && !disPass),
            cursorColor: AppColors.primaryText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              filled: true,
              fillColor: AppColors.whiteTexts,
              border: InputBorder.none,
              hintStyle: AppTextStyles.primaryStyle.copyWith(
                color: AppColors.secondryText,
              ),
              errorStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: !disPass
                          ? Icon(Icons.visibility_off_sharp)
                          : Icon(Icons.visibility_sharp),
                      onPressed: () {
                        setState(() {
                          disPass = !disPass;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
        HightSpacing(hight: 12),
      ],
    );
  }
}
