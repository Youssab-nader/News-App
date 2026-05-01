import 'package:flutter/material.dart';
import 'package:news_app/core/Data/Remote_data/api_config.dart';
import 'package:news_app/core/Data/Remote_data/api_service.dart';
import 'package:news_app/core/Models/article_model.dart';

class HomeController extends ChangeNotifier {
  bool toHeadLineLoading = true;
  bool everyThindLoading = true;

  ApiService apiService = ApiService();
  List<ArticleModel> everyThingNews = [];
  List<ArticleModel> topHeadLineNews = [];
  String? errorMessage;

  HomeController() {
    // getEveryThing();
    getTopHeadLine();
  }

  void getEveryThing() async {
    try {
      final Map<String, dynamic> arteclesJson = await apiService.get(
        ApiConfig.everyThing,
        params: {'q': ApiConfig.q},
      );

      everyThingNews = (arteclesJson[ApiConfig.articlesKey] as List)
          .map((a) => ArticleModel.fromJson(a))
          .toList();
      everyThindLoading = false;
      errorMessage = null;
    } catch (error) {
      everyThindLoading = false;
      errorMessage = error.toString();
      Exception(errorMessage);
    }

    notifyListeners();
  }

  void getTopHeadLine() async {
    try {
      final Map<String, dynamic> arteclesJson = await apiService.get(
        ApiConfig.topHeadLine,
        params: {'q': ApiConfig.q},
      );

      topHeadLineNews = (arteclesJson[ApiConfig.articlesKey] as List)
          .map((a) => ArticleModel.fromJson(a))
          .toList();
      toHeadLineLoading = false;
      errorMessage = null;
    } catch (error) {
      everyThindLoading = false;
      errorMessage = error.toString();
      Exception(errorMessage);
    }

    notifyListeners();
  }
}
