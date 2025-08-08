import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

/// {@template source}
/// A model representing the source of an article.
/// {@endtemplate}
@JsonSerializable()
class Source {
  /// {@macro source}
  Source({
    required this.id,
    this.name,
    this.url,
    this.image,
    this.description,
    this.category,
    this.language,
    this.country,
  });

  /// Creates a [Source] from a JSON object.
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  /// The unique identifier of the source.
  final String id;

  /// The name of the source.
  final String? name;

  /// The URL of the source's website.
  final String? url;

  /// The URL of the source's image.
  final String? image;

  /// The description of the source.
  final String? description;

  /// The category of the source.
  final String? category;

  /// The language of the source.
  final String? language;

  /// The country of the source.
  final String? country;

  /// Converts the [Source] to a JSON object.
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
