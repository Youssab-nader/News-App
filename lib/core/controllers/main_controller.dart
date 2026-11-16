import 'package:flutter/material.dart';
import 'package:news_app/Features/Home/Repos/news_repo.dart';
import 'package:news_app/core/Data/Enums/category_enum.dart';
import 'package:news_app/core/Data/Enums/request_status_enum.dart';
import 'package:news_app/core/Data/Remote_data/api_config.dart';
import 'package:news_app/core/Models/article_model.dart';

class MainController extends ChangeNotifier {
  MainController(this.newsRepo) {
    getTrendyNews();
    getDailyNews(q: ApiConfig.q);
  }

  RequestStatusEnum dailyNewsStatus = RequestStatusEnum.loading;
  RequestStatusEnum trendyNewsStatus = RequestStatusEnum.loading;
  RequestStatusEnum foundedNewsStatus = RequestStatusEnum.loading;
  Categories selectedCategory = Categories.values[0];

  List<ArticleModel> foundedNewsFromSearch = [];
  List<ArticleModel> dailyNews = [];
  List<ArticleModel> trendyNews = [];
  String? errorMessage;
  NewsRepository newsRepo;

  void getDailyNews({String? q}) async {
    try {
      dailyNews = await newsRepo.getDailyNews(q: q ?? Categories.topNews.q);
      dailyNewsStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (error) {
      dailyNewsStatus = RequestStatusEnum.error;
      errorMessage = error.toString();
      Exception(errorMessage);
    }

    notifyListeners();
  }

  void categoryChanged(Categories newCat) {
    selectedCategory = newCat;
    dailyNewsStatus = RequestStatusEnum.loading;
    getDailyNews(q: newCat.q);
    notifyListeners();
  }

  void getTrendyNews() async {
    try {
      trendyNews = await newsRepo.getTrendyNews();
      trendyNewsStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (error) {
      trendyNewsStatus = RequestStatusEnum.error;
      errorMessage = error.toString();
      Exception(errorMessage);
    }
    notifyListeners();
  }

  void setBookMark(int index) {
    dailyNews[index].bookMark();
    notifyListeners();
  }

  void searching(String searchingWord) async {
     try {
      foundedNewsFromSearch = await newsRepo.getSearched(searchingWord: searchingWord);
      foundedNewsStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (error) {
      foundedNewsStatus = RequestStatusEnum.error;
      errorMessage = error.toString();
      Exception(errorMessage);
    }

    notifyListeners();
  }
}
