import 'package:equatable/equatable.dart';

/// {@template author}
/// An author model.
/// {@endtemplate}
class Author extends Equatable {
  /// {@macro author}
  const Author({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  /// The author's ID.
  final String id;

  /// The author's name.
  final String name;

  /// The URL to the author's profile picture.
  final String imageUrl;

  /// Creates a copy of the current [Author] with the given fields replaced.
  Author copyWith({
    String? id,
    String? name,
    String? imageUrl,
  }) {
    return Author(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [id, name, imageUrl];
}