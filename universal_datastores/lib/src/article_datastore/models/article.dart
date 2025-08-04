import 'package:json_annotation/json_annotation.dart';
import 'package:universal_datastores/src/article_datastore/models/models.dart';

part 'article.g.dart';

/// {@template article}
/// A model representing a news article.
/// {@endtemplate}
@JsonSerializable()
class Article {
  /// {@macro article}
  Article({
    required this.guid,
    required this.ownerId,
    this.sourceId,
    this.authorName,
    this.title,
    this.slug,
    this.description,
    this.content,
    this.summary,
    this.imageUrl,
    this.videoUrl,
    this.apiArticleId,
    this.modifiedId,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.ingestedAt,
    this.isFeatured = false,
    this.source,
  });

  /// Creates an [Article] from a JSON object.
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  /// The unique identifier of the article.
  final String guid;

  /// The identifier of the owner of the article.
  final String ownerId;

  /// The identifier of the source of the article.
  final String? sourceId;

  /// The name of the author of the article.
  final String? authorName;

  /// The title of the article.
  final String? title;

  /// The slug of the article.
  final String? slug;

  /// The description of the article.
  final String? description;

  /// The content of the article.
  final String? content;

  /// The summary of the article.
  final String? summary;

  /// The URL of the image of the article.
  final String? imageUrl;

  /// The URL of the video of the article.
  final String? videoUrl;

  /// The API identifier of the article.
  final String? apiArticleId;

  /// The identifier of the user who last modified the article.
  final String? modifiedId;

  /// The date and time when the article was created.
  final DateTime? createdAt;

  /// The date and time when the article was last updated.
  final DateTime? updatedAt;

  /// The date and time when the article was published.
  final DateTime? publishedAt;

  /// The date and time when the article was ingested.
  final DateTime? ingestedAt;

  /// Whether the article is featured.
  final bool isFeatured;

  /// The source of the article.
  final Source? source;

  /// Converts the [Article] to a JSON object.
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
