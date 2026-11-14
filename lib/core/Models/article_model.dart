class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  bool isBookMarked = false;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json["author"] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: DateTime.tryParse((json['publishedAt'])) ?? DateTime.now(),
      content: json['content'] ?? '',
    );
  }

  void bookMark() {
    isBookMarked = !isBookMarked;
  }
}
