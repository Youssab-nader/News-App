import 'package:news_app/core/Data/Remote_data/api_config.dart';
import 'package:news_app/core/Data/Remote_data/api_service.dart';
import 'package:news_app/core/Models/article_model.dart';

class NewsRepository {


  Future<List<ArticleModel>> getTrendyNews() async {
    final Map<String, dynamic> articlesJson = await ApiService().get(
      ApiConfig.topHeadLine,
      params: {'q': ApiConfig.q},
    );
    return (articlesJson[ApiConfig.articlesKey] as List)
        .map((a) => ArticleModel.fromJson(a))
        .toList();
  }

  Future<List<ArticleModel>> getDailyNews(String q) async {
    final Map<String, dynamic> articlesJson = await ApiService().get(
      ApiConfig.everyThing,
      params: {'q': q},
    );
    return (articlesJson[ApiConfig.articlesKey] as List)
        .map((a) => ArticleModel.fromJson(a))
        .toList();
  }
}
