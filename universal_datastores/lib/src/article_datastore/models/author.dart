import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

/// {@template author}
/// Author model
/// This class represents an author of news articles.
/// {@endtemplate}
@JsonSerializable()
class Author {
  /// {@macro author}
  Author({this.name, this.image});

  /// Creates an Author from JSON
  /// [json] Map containing author data
  /// Returns an Author object
  /// Throws FormatException if the JSON is invalid
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  /// Converts current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  /// The author's name
  final String? name;

  /// The author's image URL
  final String? image;
}
