import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

/// {@template author}
/// A model representing the author of an article.
/// {@endtemplate}
@JsonSerializable()
class Author {
  /// {@macro author}
  Author({
    required this.id,
    required this.name,
    this.url,
    this.image,
    this.description,
  });

  /// Creates an [Author] from a JSON object.
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  /// The unique identifier of the author.
  final String id;

  /// The name of the author.
  final String name;

  /// The URL of the author's website.
  final String? url;

  /// The URL of the author's image.
  final String? image;

  /// The description of the author.
  final String? description;

  /// Converts the [Author] to a JSON object.
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
