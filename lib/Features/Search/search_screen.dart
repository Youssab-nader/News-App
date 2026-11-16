import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Components/news_card_widget.dart';
import 'package:news_app/core/controllers/main_controller.dart';
import 'package:news_app/core/Components/search_bar.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Consumer<MainController>(
      builder:
          (BuildContext context, MainController controller, Widget? child) {
            return Scaffold(
              appBar: AppBar(centerTitle: true, title: Text('Search')),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SearchBarWidget(textController: textEditingController),
                    Expanded(child: NewsCardWidget(allNews: controller.foundedNewsFromSearch)),
                  ],
                ),
              ),
            );
          },
    );
  }
}
