import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:universal_datastores/src/article_datastore/author.dart';
import 'package:universal_datastores/src/article_datastore/source.dart';
import 'package:universal_datastores/src/base/base.dart' show Record;

part 'article.g.dart';

/// {@template collection}
/// Article model
/// {@endtemplate}
@Collection(accessor: 'articles')
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Article implements Record {
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

  /// Creates a new instance of Article with the current date and time
  factory Article.now({
    required String guid,
    String ownerId = defaultOwnerId,
    String? apiArticleId,
    Source? source,
    Author? author,
    String? title,
    String? slug,
    String? description,
    String? summary,
    String? content,
    String? imageUrl,
    String? videoUrl,
    DateTime? publishedAt,
    DateTime? ingestedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool isFeatured = false,
  }) {
    return Article(
      guid: guid,
      createdAt: createdAt ?? DateTime.now(),
      ownerId: ownerId,
      updatedAt: updatedAt,
      // modifiedId: null,
      apiArticleId: apiArticleId,
      source: source,
      author: author,
      title: title,
      slug: slug,
      description: description,
      summary: summary,
      content: content,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      publishedAt: publishedAt,
      ingestedAt: ingestedAt,
      isFeatured: isFeatured,
    );
  }

  /// Converts current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  /// Unique identifier for the article
  static const String defaultOwnerId = 'system';

  /// Unique identifier for the article
  @Id()
  String get id => guid;

  /// The unique identifier for the article
  @override
  final String guid;

  /// The date and time when the article was created
  @override
  final DateTime createdAt;

  /// The date and time when the article was last updated
  @override
  final DateTime? updatedAt;

  @override
  final String? modifiedId;

  @override
  final String ownerId;

  /// The unique identifier for the article in the API
  final String? apiArticleId;

  /// The source of the article
  final Source? source;

  /// The author of the article
  final Author? author;

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
