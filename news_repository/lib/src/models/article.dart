import 'package:equatable/equatable.dart';
import 'package:news_repository/src/models/author.dart';
import 'package:news_repository/src/models/post_type.dart';
import 'package:news_repository/src/category.dart';

/// {@template article}
/// A news article.
/// {@endtemplate}
class Article extends Equatable {
  /// {@macro article}
  const Article({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.postType,
    required this.category,
    required this.imageUrl,
    required this.url,
    required this.publishedAt,
    required this.isPremium,
    required this.isBreaking,
  });

  /// The article's ID.
  final String id;

  /// The article's title.
  final String title;

  /// The article's content.
  final String content;

  /// The article's author.
  final Author author;

  /// The type of post.
  final PostType postType;

  /// The article's category.
  final Category category;

  /// The URL for the article's image.
  final String imageUrl;

  /// The canonical URL to the article.
  final String url;

  /// The date the article was published.
  final DateTime publishedAt;

  /// Whether the article is premium content.
  final bool isPremium;

  /// Whether the article is a breaking news story.
  final bool isBreaking;

  /// Creates a copy of the current [Article] with the given fields replaced.
  Article copyWith({
    String? id,
    String? title,
    String? content,
    Author? author,
    PostType? postType,
    Category? category,
    String? imageUrl,
    String? url,
    DateTime? publishedAt,
    bool? isPremium,
    bool? isBreaking,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      author: author ?? this.author,
      postType: postType ?? this.postType,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      url: url ?? this.url,
      publishedAt: publishedAt ?? this.publishedAt,
      isPremium: isPremium ?? this.isPremium,
      isBreaking: isBreaking ?? this.isBreaking,
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        content,
        author,
        postType,
        category,
        imageUrl,
        url,
        publishedAt,
        isPremium,
        isBreaking,
      ];
}
