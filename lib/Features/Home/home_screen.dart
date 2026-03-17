import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Data/Remote_data/api_config.dart';
import 'package:news_app/core/Data/Remote_data/api_service.dart';

import 'package:news_app/core/Models/article_model.dart';
import 'package:news_app/core/Style/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  List<ArticleModel> allArts = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  void _loadNews() async {
    try {
      final Map<String, dynamic> arteclesJson = await apiService.get(
        ApiConfig.everyThing,
        params: {'q': ApiConfig.q},
      );

      setState(() {
        allArts = (arteclesJson[ApiConfig.articlesKey] as List)
            .map((a) => ArticleModel.fromJson(a))
            .toList();
        isLoading = false;
        errorMessage = null;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = error.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: const CircularProgressIndicator())
          : (errorMessage != null)
          ? Center(
              child: Text('##############Error############# \n $errorMessage'),
            )
          : Padding(
              padding: EdgeInsets.all(16.r),
              child: ListView.builder(
                itemCount: allArts.length,
                itemBuilder: (context, index) {
                  return Text(
                    allArts[index].title,
                    style: AppTextStyles.primaryStyle,
                  );
                },
              ),
            ),
    );
  }
}
