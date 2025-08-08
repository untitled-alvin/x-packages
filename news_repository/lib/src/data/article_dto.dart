import 'package:news_repository/src/data/author_dto.dart';
import 'package:news_repository/src/models/models.dart';

class ArticleDto {
  const ArticleDto({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.url,
    required this.isPremium,
    required this.postType,
    required this.author,
    this.publishedAt,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) {
    return ArticleDto(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['image_url'] as String,
      url: json['url'] as String,
      isPremium: json['is_premium'] as bool,
      postType: PostType.values.firstWhere((e) => e.name == json['post_type']),
      publishedAt: json['published_at'] == null
          ? null
          : DateTime.parse(json['published_at'] as String),
      author: AuthorDto.fromJson(json['author'] as Map<String, dynamic>),
    );
  }

  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String url;
  final bool isPremium;
  final PostType postType;
  final DateTime? publishedAt;
  final AuthorDto author;
}