import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:universal_datastores/src/article_datastore/tables.dart';

part 'database.g.dart';

/// {@template article_database}
/// The article database.
/// {@endtemplate}
@DriftDatabase(tables: [Articles, Authors, Sources])
class ArticleDatabase extends _$ArticleDatabase {
  /// {@macro article_database}
  ArticleDatabase({bool isTest = false}) : super(_openConnection(isTest));

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection(bool isTest) {
  if (isTest) {
    return LazyDatabase(() async => NativeDatabase.memory());
  }
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
