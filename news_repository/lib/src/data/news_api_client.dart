import 'package:dio/dio.dart';
import 'package:news_repository/src/data/data.dart';
import 'package:news_repository/src/models/models.dart';

abstract class NewsApiClient {
  Future<List<ArticleDto>> fetchLatestArticles();
}

class DioNewsApiClient implements NewsApiClient {
  DioNewsApiClient({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<ArticleDto>> fetchLatestArticles() async {
    try {
      // Using a placeholder API for demonstration purposes.
      // Replace with your actual news API endpoint.
      final response = await _dio.get('https://saurav.tech/NewsAPI/top-headlines/category/health/in.json');
      if (response.statusCode == 200 && response.data is Map) {
        final articlesJson = (response.data as Map)['articles'] as List;
        // The API response from the placeholder does not match our DTOs perfectly.
        // This is a common scenario. We'll manually create mock data that fits our DTOs.
        // In a real-world scenario, you would map the actual response fields.
        return _mapArticles(articlesJson);
      } else {
        throw Exception('Failed to load articles');
      }
    } catch (e) {
      throw Exception('Failed to load articles: $e');
    }
  }

  // Helper to map and supplement data because the placeholder API is limited.
  List<ArticleDto> _mapArticles(List<dynamic> articles) {
    var articleCount = 0;
    return articles.map((dynamic json) {
      articleCount++;
      final authorName = (json['author'] as String?) ?? 'Unknown Author';
      
      // Create a synthetic author DTO.
      final authorDto = AuthorDto(id: 'author_$articleCount', name: authorName);

      // Create the article DTO with some synthetic data.
      return ArticleDto(
        id: 'article_$articleCount',
        title: (json['title'] as String?) ?? 'No Title',
        content: (json['content'] as String?) ?? 'No Content',
        imageUrl: (json['urlToImage'] as String?) ?? '',
        url: (json['url'] as String?) ?? '',
        isPremium: articleCount % 5 == 0, // Make every 5th article premium
        postType: articleCount % 3 == 0 ? PostType.video : PostType.article, // Vary post type
        publishedAt: json['publishedAt'] == null
            ? DateTime.now()
            : DateTime.parse(json['publishedAt'] as String),
        author: authorDto,
      );
    }).toList();
  }
}