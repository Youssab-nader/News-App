import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HightSpacing extends StatelessWidget {
  final double hight;
  const HightSpacing({super.key, required this.hight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: hight.h,);
  }
}

class WidthSpacing extends StatelessWidget {
  final double width;
  const WidthSpacing({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w,);
  }
}
