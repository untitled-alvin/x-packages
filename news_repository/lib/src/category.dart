import 'package:equatable/equatable.dart';

/// {@template category}
/// A news article category.
/// {@endtemplate}
class Category extends Equatable {
  /// {@macro category}
  const Category({
    required this.name,
    required this.label,
    required this.emoji,
  });

  /// A list of all available categories.
  static const List<Category> values = [
    business,
    entertainment,
    health,
    science,
    sports,
    technology,
  ];

  /// A category for business news.
  static const business = Category(
    name: 'business',
    label: 'Business',
    emoji: '💼',
  );

  /// A category for entertainment news.
  static const entertainment = Category(
    name: 'entertainment',
    label: 'Entertainment',
    emoji: '🎬',
  );

  /// A category for health news.
  static const health = Category(
    name: 'health',
    label: 'Health',
    emoji: '⚕️',
  );

  /// A category for science news.
  static const science = Category(
    name: 'science',
    label: 'Science',
    emoji: '🔬',
  );

  /// A category for sports news.
  static const sports = Category(
    name: 'sports',
    label: 'Sports',
    emoji: '⚽',
  );

  /// A category for technology news.
  static const technology = Category(
    name: 'technology',
    label: 'Technology',
    emoji: '💻',
  );

  /// The name of the category.
  final String name;

  /// The display label for the category.
  final String label;

  /// The emoji associated with the category.
  final String emoji;

  @override
  List<Object> get props => [name, label, emoji];
}
