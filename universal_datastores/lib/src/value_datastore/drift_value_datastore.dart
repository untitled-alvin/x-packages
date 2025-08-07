import 'package:drift/drift.dart';
import 'package:universal_datastores/src/exceptions.dart';
import 'package:universal_datastores/src/value_datastore/value_datastore.dart';

part 'drift_value_datastore.g.dart';
part 'extension.dart';

/// {@template values}
/// The values table.
/// {@endtemplate}
@DataClassName('KeyValueData')
class Values extends Table {
  /// The unique identifier of the value.
  TextColumn get key => text()();

  /// The description of the value.
  TextColumn get description => text().nullable()();

  /// The data of the value.
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

/// {@template value_database}
/// The key value database.
/// {@endtemplate}
@DriftDatabase(tables: [Values])
class ValueDatabase extends _$ValueDatabase {
  /// {@macro value_database}
  ValueDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

/// {@template drift_value_datastore_api}
/// Implement for the articles datastore with Drift.
/// {@endtemplate}
class DriftValueDatastore implements ValueDatastore {
  /// {@macro drift_value_datastore_api}
  DriftValueDatastore({
    required ValueDatabase database,
  }) : _database = database;

  final ValueDatabase _database;

  @override
  Future<KeyValue?> get(String id) async {
    try {
      final query = _database.select(_database.values)
        ..where((tbl) => tbl.key.equals(id));
      final data = await query.getSingleOrNull();
      return data?.toModel();
    } catch (e, s) {
      throw GetFailedException(e, s);
    }
  }

  @override
  Future<KeyValue> put(
    String key,
    String value, {
    String? description,
  }) async {
    try {
      final companion = ValuesCompanion.insert(
        key: key,
        value: value,
        description: Value(description),
      );
      final result = await _database
          .into(_database.values)
          .insertReturning(
            companion,
            mode: InsertMode.insertOrReplace,
          );
      return result.toModel();
    } catch (e, s) {
      throw PutFailedException(e, s);
    }
  }

  @override
  Future<List<KeyValue>> getAll() async {
    final query = _database.select(_database.values);
    final result = await query.get();
    return result.map((e) => e.toModel()).toList();
  }

  @override
  Future<void> putAll(List<KeyValue> data) async {
    if (data.isEmpty) return;
    try {
      await _database.batch((batch) {
        batch.insertAllOnConflictUpdate(
          _database.values,
          data.map((row) => row.toCompanion()),
        );
      });
    } catch (e, s) {
      throw PutFailedException(e, s);
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final query = _database.delete(_database.values)
        ..where((tbl) => tbl.key.equals(id));
      await query.go();
    } catch (e, s) {
      throw DeleteFailedException(e, s);
    }
  }
}
