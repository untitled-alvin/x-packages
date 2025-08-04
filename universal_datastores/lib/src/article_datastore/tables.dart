import 'package:drift/drift.dart';

/// {@template articles}
/// The articles table.
/// {@endtemplate}
@DataClassName('ArticleData')
class Articles extends Table {
  /// The unique identifier of the article.
  TextColumn get guid => text()();

  /// The identifier of the owner of the article.
  TextColumn get ownerId => text()();

  /// The identifier of the source of the article.
  TextColumn get sourceId => text().nullable()();

  /// The name of the author of the article.
  TextColumn get authorName => text().nullable()();

  /// The title of the article.
  TextColumn get title => text().nullable()();

  /// The slug of the article.
  TextColumn get slug => text().nullable()();

  /// The description of the article.
  TextColumn get description => text().nullable()();

  /// The content of the article.
  TextColumn get content => text().nullable()();

  /// The summary of the article.
  TextColumn get summary => text().nullable()();

  /// The URL of the image of the article.
  TextColumn get imageUrl => text().nullable()();

  /// The URL of the video of the article.
  TextColumn get videoUrl => text().nullable()();

  /// The API identifier of the article.
  TextColumn get apiArticleId => text().nullable()();

  /// The identifier of the user who last modified the article.
  TextColumn get modifiedId => text().nullable()();

  /// The date and time when the article was created.
  DateTimeColumn get createdAt => dateTime().nullable()();

  /// The date and time when the article was last updated.
  DateTimeColumn get updatedAt => dateTime().nullable()();

  /// The date and time when the article was published.
  DateTimeColumn get publishedAt => dateTime().nullable()();

  /// The date and time when the article was ingested.
  DateTimeColumn get ingestedAt => dateTime().nullable()();

  /// Whether the article is featured.
  BoolColumn get isFeatured => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {guid};
}

/// {@template authors}
/// The authors table.
/// {@endtemplate}
@DataClassName('AuthorData')
class Authors extends Table {
  /// The unique identifier of the author.
  TextColumn get id => text()();

  /// The name of the author.
  TextColumn get name => text()();

  /// The URL of the author's website.
  TextColumn get url => text().nullable()();

  /// The URL of the author's image.
  TextColumn get image => text().nullable()();

  /// The description of the author.
  TextColumn get description => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// {@template sources}
/// The sources table.
/// {@endtemplate}
@DataClassName('SourceData')
class Sources extends Table {
  /// The unique identifier of the source.
  TextColumn get id => text()();

  /// The name of the source.
  TextColumn get name => text().nullable()();

  /// The URL of the source's website.
  TextColumn get url => text().nullable()();

  /// The URL of the source's image.
  TextColumn get image => text().nullable()();

  /// The description of the source.
  TextColumn get description => text().nullable()();

  /// The category of the source.
  TextColumn get category => text().nullable()();

  /// The language of the source.
  TextColumn get language => text().nullable()();

  /// The country of the source.
  TextColumn get country => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
