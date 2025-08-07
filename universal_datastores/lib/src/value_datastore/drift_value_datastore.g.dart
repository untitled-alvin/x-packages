// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_value_datastore.dart';

// ignore_for_file: type=lint
class $ValuesTable extends Values with TableInfo<$ValuesTable, KeyValueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, description, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'values';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeyValueData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  KeyValueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeyValueData(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $ValuesTable createAlias(String alias) {
    return $ValuesTable(attachedDatabase, alias);
  }
}

class KeyValueData extends DataClass implements Insertable<KeyValueData> {
  /// The unique identifier of the value.
  final String key;

  /// The description of the value.
  final String? description;

  /// The data of the value.
  final String value;
  const KeyValueData({
    required this.key,
    this.description,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['value'] = Variable<String>(value);
    return map;
  }

  ValuesCompanion toCompanion(bool nullToAbsent) {
    return ValuesCompanion(
      key: Value(key),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      value: Value(value),
    );
  }

  factory KeyValueData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeyValueData(
      key: serializer.fromJson<String>(json['key']),
      description: serializer.fromJson<String?>(json['description']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'description': serializer.toJson<String?>(description),
      'value': serializer.toJson<String>(value),
    };
  }

  KeyValueData copyWith({
    String? key,
    Value<String?> description = const Value.absent(),
    String? value,
  }) => KeyValueData(
    key: key ?? this.key,
    description: description.present ? description.value : this.description,
    value: value ?? this.value,
  );
  KeyValueData copyWithCompanion(ValuesCompanion data) {
    return KeyValueData(
      key: data.key.present ? data.key.value : this.key,
      description: data.description.present
          ? data.description.value
          : this.description,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueData(')
          ..write('key: $key, ')
          ..write('description: $description, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, description, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeyValueData &&
          other.key == this.key &&
          other.description == this.description &&
          other.value == this.value);
}

class ValuesCompanion extends UpdateCompanion<KeyValueData> {
  final Value<String> key;
  final Value<String?> description;
  final Value<String> value;
  final Value<int> rowid;
  const ValuesCompanion({
    this.key = const Value.absent(),
    this.description = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ValuesCompanion.insert({
    required String key,
    this.description = const Value.absent(),
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<KeyValueData> custom({
    Expression<String>? key,
    Expression<String>? description,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (description != null) 'description': description,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ValuesCompanion copyWith({
    Value<String>? key,
    Value<String?>? description,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return ValuesCompanion(
      key: key ?? this.key,
      description: description ?? this.description,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ValuesCompanion(')
          ..write('key: $key, ')
          ..write('description: $description, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$ValueDatabase extends GeneratedDatabase {
  _$ValueDatabase(QueryExecutor e) : super(e);
  $ValueDatabaseManager get managers => $ValueDatabaseManager(this);
  late final $ValuesTable values = $ValuesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [values];
}

typedef $$ValuesTableCreateCompanionBuilder =
    ValuesCompanion Function({
      required String key,
      Value<String?> description,
      required String value,
      Value<int> rowid,
    });
typedef $$ValuesTableUpdateCompanionBuilder =
    ValuesCompanion Function({
      Value<String> key,
      Value<String?> description,
      Value<String> value,
      Value<int> rowid,
    });

class $$ValuesTableFilterComposer
    extends Composer<_$ValueDatabase, $ValuesTable> {
  $$ValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ValuesTableOrderingComposer
    extends Composer<_$ValueDatabase, $ValuesTable> {
  $$ValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ValuesTableAnnotationComposer
    extends Composer<_$ValueDatabase, $ValuesTable> {
  $$ValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$ValuesTableTableManager
    extends
        RootTableManager<
          _$ValueDatabase,
          $ValuesTable,
          KeyValueData,
          $$ValuesTableFilterComposer,
          $$ValuesTableOrderingComposer,
          $$ValuesTableAnnotationComposer,
          $$ValuesTableCreateCompanionBuilder,
          $$ValuesTableUpdateCompanionBuilder,
          (
            KeyValueData,
            BaseReferences<_$ValueDatabase, $ValuesTable, KeyValueData>,
          ),
          KeyValueData,
          PrefetchHooks Function()
        > {
  $$ValuesTableTableManager(_$ValueDatabase db, $ValuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ValuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ValuesCompanion(
                key: key,
                description: description,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                Value<String?> description = const Value.absent(),
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => ValuesCompanion.insert(
                key: key,
                description: description,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$ValueDatabase,
      $ValuesTable,
      KeyValueData,
      $$ValuesTableFilterComposer,
      $$ValuesTableOrderingComposer,
      $$ValuesTableAnnotationComposer,
      $$ValuesTableCreateCompanionBuilder,
      $$ValuesTableUpdateCompanionBuilder,
      (
        KeyValueData,
        BaseReferences<_$ValueDatabase, $ValuesTable, KeyValueData>,
      ),
      KeyValueData,
      PrefetchHooks Function()
    >;

class $ValueDatabaseManager {
  final _$ValueDatabase _db;
  $ValueDatabaseManager(this._db);
  $$ValuesTableTableManager get values =>
      $$ValuesTableTableManager(_db, _db.values);
}
