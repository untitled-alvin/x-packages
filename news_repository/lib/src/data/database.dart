import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:news_repository/src/models/models.dart' as models;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('Author')
class Authors extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Article')
class Articles extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get imageUrl => text()();
  TextColumn get url => text()();
  BoolColumn get isPremium => boolean()();
  TextColumn get postType => text().map(const PostTypeConverter())();
  DateTimeColumn get publishedAt => dateTime().nullable()();
  TextColumn get authorId => text().references(Authors, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Articles, Authors])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.inMemory() : super(NativeDatabase.memory());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

class PostTypeConverter extends TypeConverter<models.PostType, String> {
  const PostTypeConverter();

  @override
  models.PostType fromSql(String fromDb) {
    return models.PostType.values.firstWhere((e) => e.name == fromDb);
  }

  @override
  String toSql(models.PostType value) {
    return value.name;
  }
}