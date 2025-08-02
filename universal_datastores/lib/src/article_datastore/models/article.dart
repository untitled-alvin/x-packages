import 'package:json_annotation/json_annotation.dart';
import 'package:universal_datastores/src/article_datastore/models/models.dart';

part 'article.g.dart';

/// {@template collection}
/// Article model
/// {@endtemplate}
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Article {
  /// {@macro article}
  const Article({
    required this.guid,
    required this.createdAt,
    required this.ownerId,
    this.modifiedId,
    this.updatedAt,
    this.apiArticleId,
    this.source,
    this.author,
    this.sourceId,
    this.authorName,
    this.title,
    this.slug,
    this.description,
    this.summary,
    this.content,
    this.imageUrl,
    this.videoUrl,
    this.publishedAt,
    this.ingestedAt,
    this.isFeatured = false,
  });

  /// Creates a Article from JSON
  /// [json] Map containing article data
  /// Returns a Article object
  /// Throws FormatException if the JSON is invalid
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  /// Converts current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  /// Unique identifier for the article
  static const String defaultOwnerId = 'system';

  /// The unique identifier for the article

  final String guid;

  /// The date and time when the article was created

  final DateTime createdAt;

  /// The date and time when the article was last updated
  final DateTime? updatedAt;

  /// The unique identifier of the article that was modified
  final String? modifiedId;

  /// The unique identifier of the owner of the article
  /// This is typically the user or system that created the article
  final String ownerId;

  /// The unique identifier for the article in the API
  final String? apiArticleId;

  /// The source of the article
  final Source? source;

  /// The author of the article
  final Author? author;

  /// The id of the source of the article
  final String? sourceId;

  /// The name of the author of the article
  final String? authorName;

  /// The title of the article
  final String? title;

  /// The slug of the article
  final String? slug;

  /// The description of the article
  final String? description;

  /// The summary of the article
  final String? summary;

  /// The content of the article
  final String? content;

  /// The image URL of the article
  final String? imageUrl;

  /// The video URL of the article
  final String? videoUrl;

  /// The date and time when the article was published
  final DateTime? publishedAt;

  /// The date and time when the article was ingested
  final DateTime? ingestedAt;

  /// Whether the article is featured
  final bool isFeatured;
}
