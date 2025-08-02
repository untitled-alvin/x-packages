import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

/// {@template source}
/// Source model
/// This class represents a source of news articles.
/// It contains information about the source's ID, name, URL, and image.
/// This constructor initializes the source with the provided values.
/// If any of the values are null, they will be set to null in the object.
/// This is useful for creating a source object from JSON or other data formats.
// ```
//"id": "abc-news",
// "name": "ABC News",
// "description": "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
// "url": "https://abcnews.go.com",
// "category": "general",
// "language": "en",
// "country": "us"
// ```
/// {@endtemplate}
@JsonSerializable()
class Source {
  /// {@macro source}
  const Source({
    this.id,
    this.name,
    this.url,
    this.image,
    this.description,
    this.category,
    this.language,
    this.country,
  });

  /// Creates a Source from JSON
  /// [json] Map containing source data
  /// Returns a Source object
  /// Throws FormatException if the JSON is invalid
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  /// Converts current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() => _$SourceToJson(this);

  /// The source's id
  final String? id;

  /// The source's name
  final String? name;

  /// The source's url
  final String? url;

  /// The source's image
  final String? image;

  /// The source's description
  final String? description;

  /// The source's category
  final String? category;

  /// The source's language
  final String? language;

  /// The source's country
  final String? country;
}
