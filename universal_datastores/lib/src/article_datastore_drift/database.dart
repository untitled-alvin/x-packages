// ignore_for_file: public_member_api_docs, document_ignores

part of 'article_datastore_drift.dart';

@DriftDatabase(tables: [Articles, Sources])
class ArticleDatabase extends _$ArticleDatabase {
  /// Creates a new instance of [ArticleDatabase].
  /// [e] The query executor to use for database operations.
  ArticleDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

@DataClassName('SourceData')
class Sources extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().nullable()();
  TextColumn get url => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text().nullable()();
  TextColumn get language => text().nullable()();
  TextColumn get country => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ArticleData')
class Articles extends Table {
  TextColumn get guid => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get modifiedId => text().nullable()();
  TextColumn get ownerId => text()();
  TextColumn get apiArticleId => text().nullable()();
  TextColumn get sourceId => text().references(Sources, #id)();
  TextColumn get authorName => text().nullable()();
  TextColumn get title => text().nullable()();
  TextColumn get slug => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get summary => text().nullable()();
  TextColumn get content => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get videoUrl => text().nullable()();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  DateTimeColumn get ingestedAt => dateTime().nullable()();
  BoolColumn get isFeatured => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {guid};
}
