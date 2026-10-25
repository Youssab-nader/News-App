import 'package:flutter/material.dart';
import 'package:news_app/core/Data/Enums/category_enum.dart';
import 'package:news_app/core/Data/Remote_data/api_config.dart';
import 'package:news_app/core/Data/Remote_data/api_service.dart';
import 'package:news_app/core/Models/article_model.dart';

class HomeController extends ChangeNotifier {
  bool topHeadLineLoading = true;
  bool everyThindLoading = true;
  Categories selectedCategory = Categories.values[0];
  ApiService apiService = ApiService();
  List<ArticleModel> everyThingNews = [];
  List<ArticleModel> topHeadLineNews = [];
  String? errorMessage;

  HomeController() {
    getTopHeadLine();
    getEveryThing(ApiConfig.q);
  }

  void getEveryThing(String q) async {
    try {
      final Map<String, dynamic> arteclesJson = await apiService.get(
        ApiConfig.everyThing,
        params: {'q': q},
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

  void categoryChanged(Categories newCat) {
    selectedCategory = newCat;
    everyThindLoading = true;
    getEveryThing(newCat.q);
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
      topHeadLineLoading = false;
      errorMessage = null;
    } catch (error) {
      everyThindLoading = false;
      errorMessage = error.toString();
      Exception(errorMessage);
    }

    notifyListeners();
  }

  void setBookMark(int index) {
    everyThingNews[index].bookMark();
    notifyListeners();
  }
}
