import 'package:flutter/material.dart';
import 'package:news_app/core/Data/Enums/category_enum.dart';
import 'package:news_app/core/Data/Enums/request_status_enum.dart';
import 'package:news_app/core/Data/Remote_data/api_config.dart';
import 'package:news_app/core/Data/Remote_data/api_service.dart';
import 'package:news_app/core/Models/article_model.dart';

class HomeController extends ChangeNotifier {
  RequestStatusEnum statusEnum = RequestStatusEnum.loading;
  Categories selectedCategory = Categories.values[0];
  ApiService apiService = ApiService();
  List<ArticleModel> everyThingNews = [];
  List<ArticleModel> trendyNews = [];
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
      statusEnum = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (error) {
      statusEnum = RequestStatusEnum.error;
      errorMessage = error.toString();
      Exception(errorMessage);
    }

    notifyListeners();
  }

  void categoryChanged(Categories newCat) {
    selectedCategory = newCat;
    statusEnum = RequestStatusEnum.loading;
    getEveryThing(newCat.q);
    notifyListeners();
  }

  void getTopHeadLine() async {
    try {
      final Map<String, dynamic> arteclesJson = await apiService.get(
        ApiConfig.topHeadLine,
        params: {'q': ApiConfig.q},
      );

      trendyNews = (arteclesJson[ApiConfig.articlesKey] as List)
          .map((a) => ArticleModel.fromJson(a))
          .toList();
      statusEnum = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (error) {
     statusEnum = RequestStatusEnum.error;
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
