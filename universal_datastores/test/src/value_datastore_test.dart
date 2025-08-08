// ignore_for_file: subtype_of_sealed_class, document_ignores, void_checks

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:universal_datastores/src/value_datastore/drift_value_datastore.dart';
import 'package:universal_datastores/src/value_datastore/value_datastore.dart';

class MockValueDatabase extends Mock implements ValueDatabase {}

class MockValuesTable extends Mock implements $ValuesTable {}

class MockSimpleSelectStatement<T extends HasResultSet, D> extends Mock
    implements SimpleSelectStatement<T, D> {}

class MockInsertStatement<T extends Table, D> extends Mock
    implements InsertStatement<T, D> {}

class MockDeleteStatement<T extends Table, D> extends Mock
    implements DeleteStatement<T, D> {}

class FakeInsertable<T> extends Fake implements Insertable<T> {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeInsertable<KeyValueData>());
  });

  group('DriftValueDatastore', () {
    late DriftValueDatastore valueDatastore;
    late MockValueDatabase mockValueDatabase;
    late MockValuesTable mockValuesTable;
    late MockSimpleSelectStatement<$ValuesTable, KeyValueData>
    mockSelectStatement;
    late MockInsertStatement<$ValuesTable, KeyValueData> mockInsertStatement;
    late MockDeleteStatement<$ValuesTable, KeyValueData> mockDeleteStatement;

    setUp(() {
      mockValueDatabase = MockValueDatabase();
      mockValuesTable = MockValuesTable();
      valueDatastore = DriftValueDatastore(database: mockValueDatabase);
      mockSelectStatement =
          MockSimpleSelectStatement<$ValuesTable, KeyValueData>();
      mockInsertStatement = MockInsertStatement<$ValuesTable, KeyValueData>();
      mockDeleteStatement = MockDeleteStatement<$ValuesTable, KeyValueData>();

      when(() => mockValueDatabase.values).thenReturn(mockValuesTable);
      when(
        () => mockValueDatabase.select(mockValuesTable),
      ).thenReturn(mockSelectStatement);
      when(
        () => mockValueDatabase.into(mockValuesTable),
      ).thenReturn(mockInsertStatement);
      when(
        () => mockValueDatabase.delete(mockValuesTable),
      ).thenReturn(mockDeleteStatement);

      // For where clauses
      when(
        () => mockSelectStatement.where(any()),
      ).thenReturn(mockSelectStatement);
      when(
        () => mockDeleteStatement.where(any()),
      ).thenReturn(mockDeleteStatement);
    });

    test('get returns value when found', () async {
      const keyValueData = KeyValueData(key: 'test', value: 'value');
      when(
        () => mockSelectStatement.getSingleOrNull(),
      ).thenAnswer((_) async => keyValueData);

      final result = await valueDatastore.get('test');

      expect(result, isNotNull);
      expect(result!.key, 'test');
      expect(result.value, 'value');
      verify(() => mockValueDatabase.select(mockValuesTable)).called(1);
    });

    test('get returns null when not found', () async {
      when(
        () => mockSelectStatement.getSingleOrNull(),
      ).thenAnswer((_) async => null);

      final result = await valueDatastore.get('test');

      expect(result, isNull);
      verify(() => mockValueDatabase.select(mockValuesTable)).called(1);
    });

    test('put returns the inserted value', () async {
      const keyValueData = KeyValueData(key: 'test', value: 'value');
      when(
        () => mockInsertStatement.insertReturning(
          any(),
          mode: any(named: 'mode'),
        ),
      ).thenAnswer((_) async => keyValueData);

      final result = await valueDatastore.put('test', 'value');

      expect(result, isNotNull);
      expect(result.key, 'test');
      expect(result.value, 'value');
      verify(() => mockValueDatabase.into(mockValuesTable)).called(1);
    });

    test('getAll returns all values', () async {
      final data = [
        const KeyValueData(key: 'test1', value: 'value1'),
        const KeyValueData(key: 'test2', value: 'value2'),
      ];
      when(() => mockSelectStatement.get()).thenAnswer((_) async => data);

      final result = await valueDatastore.getAll();

      expect(result, hasLength(2));
      expect(result[0].key, 'test1');
      expect(result[1].key, 'test2');
      verify(() => mockValueDatabase.select(mockValuesTable)).called(1);
    });

    test('putAll completes successfully', () async {
      final data = [
        KeyValue(key: 'test1', value: 'value1'),
        KeyValue(key: 'test2', value: 'value2'),
      ];
      when(
        () => mockValueDatabase.batch(any()),
      ).thenAnswer((_) async => Future.value());

      await valueDatastore.putAll(data);

      verify(() => mockValueDatabase.batch(any())).called(1);
    });

    test('delete completes successfully', () async {
      when(() => mockDeleteStatement.go()).thenAnswer((_) async => 1);

      await valueDatastore.delete('test');

      verify(() => mockValueDatabase.delete(mockValuesTable)).called(1);
    });
  });
}
