import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
        
          return SizedBox(
            width: 78.w,
            child: Text(''),
          );
        },
      ),
    );
  }
}
