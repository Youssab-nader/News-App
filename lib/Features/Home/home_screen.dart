import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/Models/article_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> allArts = [];

  @override
  void initState() {
    _loadNews();
    super.initState();
  }

  void _loadNews() async {
    var url = Uri.https('newsapi.org', 'v2/everything', {
      'apiKey': "32e73a68843c44f3bc5ab850983ec22d",
      'q': "bitcoin",
    });

    final http.Response respons = await http.get(url);
    final Map<String, dynamic> newsJson =
        jsonDecode(respons.body) as Map<String, dynamic>;
    final List<dynamic> articlesJson = newsJson['articles'];

    setState(() {
      allArts = articlesJson
          .map((article) => ArticleModel.fromJson(article))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: allArts.length,
          itemBuilder: (context, index) {
            return allArts.isEmpty ? SizedBox() : Text(allArts[index].author);
          },
        ),
      ),
    );
  }
}
