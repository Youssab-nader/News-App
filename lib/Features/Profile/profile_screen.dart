import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/Features/Profile/components/profile_image_comp.dart';
import 'package:news_app/Features/Profile/components/profile_info_comp.dart';
import 'package:news_app/Features/Profile/profile_data_controller.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileDataController(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Profile')),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.r),
            child: Column(children: [ProfileImage(), ProfileInfoWidget()]),
          ),
        );
      },
    );
  }
}
