import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _loadNews();
  }

  void _loadNews() async {
    final Map<String, dynamic> arteclesJson = await apiService.get(
      'v2/everything?q=all&apiKey=32e73a68843c44f3bc5ab850983ec22d',
    );
    setState(() {
      allArts = (arteclesJson["articles"] as List)
          .map((a) => ArticleModel.fromJson(a))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: (allArts.isEmpty)
            ? SizedBox()
            : Padding(
                padding: EdgeInsetsGeometry.all(16),
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
      ),
    );
  }
}
