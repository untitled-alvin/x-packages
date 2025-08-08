import 'package:equatable/equatable.dart';

/// {@template user}
/// A user model.
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  /// The user's ID.
  final String id;

  /// The user's name.
  final String name;

  /// The URL to the user's profile picture.
  final String imageUrl;

  /// Creates a copy of the current [User] with the given fields replaced.
  User copyWith({
    String? id,
    String? name,
    String? imageUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [id, name, imageUrl];
}
