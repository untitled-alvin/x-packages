// // ignore_for_file: subtype_of_sealed_class, document_ignores, void_checks

// import 'package:drift/drift.dart' hide isNotNull, isNull;
// import 'package:mocktail/mocktail.dart';
// import 'package:test/test.dart';
// import 'package:universal_datastores/src/article_datastore/article_datastore.dart';
// import 'package:universal_datastores/src/article_datastore/drift_article_datastore.dart';
// import 'package:universal_datastores/src/datastore.dart' show OrderMode;
// import 'package:universal_datastores/src/exceptions.dart';

// class MockArticleDatabase extends Mock implements ArticleDatabase {}

// class MockArticlesTable extends Mock implements $ArticlesTable {}

// class MockSourcesTable extends Mock implements $SourcesTable {}

// class MockSimpleSelectStatement<T extends HasResultSet, D> extends Mock
//     implements SimpleSelectStatement<T, D> {}

// class MockSelectStatementWithApplyQueryParams
//     extends MockSimpleSelectStatement<$ArticlesTable, ArticleData>
//     implements SimpleSelectStatement<$ArticlesTable, ArticleData> {
//   @override
//   SimpleSelectStatement<$ArticlesTable, ArticleData> applyQueryParams(
//     QueryParams params,
//   ) {
//     return this;
//   }
// }

// class MockDeleteStatement<T extends Table, D> extends Mock
//     implements DeleteStatement<T, D> {}

// class MockBatch extends Mock implements Batch {}

// void main() {
//   setUpAll(() {
//     registerFallbackValue(const ArticleQueryParams());
//     registerFallbackValue(
//       ArticlesCompanion.insert(
//         guid: '',
//         ownerId: '',
//         createdAt: Value(DateTime(2025)),
//       ),
//     );
//     registerFallbackValue(<ArticlesCompanion>[]);
//     registerFallbackValue(SourcesCompanion.insert(id: ''));
//     registerFallbackValue(<SourcesCompanion>[]);
//   });

//   group('DriftArticleDatastore', () {
//     late DriftArticleDatastore articleDatastore;
//     late MockArticleDatabase mockArticleDatabase;
//     late MockArticlesTable mockArticlesTable;
//     late MockSourcesTable mockSourcesTable;
//     late MockSimpleSelectStatement<$ArticlesTable, ArticleData>
//     mockSelectStatement;
//     late MockDeleteStatement<$ArticlesTable, ArticleData> mockDeleteStatement;
//     late MockBatch mockBatch;

//     setUp(() {
//       mockArticleDatabase = MockArticleDatabase();
//       mockArticlesTable = MockArticlesTable();
//       mockSourcesTable = MockSourcesTable();
//       articleDatastore = DriftArticleDatastore(database: mockArticleDatabase);
//       mockSelectStatement = MockSelectStatementWithApplyQueryParams();
//       mockDeleteStatement = MockDeleteStatement<$ArticlesTable, ArticleData>();
//       mockBatch = MockBatch();
//       reset(mockBatch);

//       when(() => mockArticleDatabase.articles).thenReturn(mockArticlesTable);
//       when(() => mockArticleDatabase.sources).thenReturn(mockSourcesTable);
//       when(
//         () => mockArticleDatabase.select(mockArticlesTable),
//       ).thenReturn(mockSelectStatement);
//       when(
//         () => mockArticleDatabase.delete(mockArticlesTable),
//       ).thenReturn(mockDeleteStatement);
//       when(() => mockArticleDatabase.batch(any())).thenAnswer((
//         invocation,
//       ) async {
//         final batchFunction =
//             invocation.positionalArguments.first as Function(Batch);
//         await batchFunction(mockBatch);
//       });

//       // For where clauses
//       when(
//         () => mockSelectStatement.where(any()),
//       ).thenReturn(mockSelectStatement);
//       when(
//         () => mockDeleteStatement.where(any()),
//       ).thenReturn(mockDeleteStatement);
//       when(() => mockSelectStatement.get()).thenAnswer((_) async => []);
//       when(
//         () => mockSelectStatement.getSingleOrNull(),
//       ).thenAnswer((_) async => null);

//       when(
//         () => mockSelectStatement.applyQueryParams(any()),
//       ).thenReturn(mockSelectStatement);

//       when(() => mockArticleDatabase.batch(any())).thenAnswer((
//         invocation,
//       ) async {
//         final batchFunction =
//             invocation.positionalArguments.first as Function(Batch);
//         when(
//           () => mockBatch.insert(mockArticlesTable, any()),
//         ).thenAnswer((_) async {});
//         when(
//           () => mockBatch.insertAll(mockArticlesTable, any()),
//         ).thenAnswer((_) async {});
//         when(
//           () => mockBatch.insertAllOnConflictUpdate(mockSourcesTable, any()),
//         ).thenAnswer((_) async {});
//         await batchFunction(mockBatch);
//       });
//     });

//     test('get returns value when found', () async {
//       final articleData = ArticleData(
//         guid: 'test',
//         ownerId: 'owner1',
//         createdAt: DateTime.now(),
//         isFeatured: false,
//         title: 'title',
//         content: 'content',
//         authorName: 'author1',
//         sourceId: 'source1',
//       );
//       when(
//         () => mockSelectStatement.getSingleOrNull(),
//       ).thenAnswer((_) async => articleData);

//       final result = await articleDatastore.get('test');

//       expect(result, isNotNull);
//       expect(result!.guid, 'test');
//       expect(result.title, 'title');
//       verify(() => mockArticleDatabase.select(mockArticlesTable)).called(1);
//     });

//     test('get returns null when not found', () async {
//       final result = await articleDatastore.get('test');

//       expect(result, isNull);
//       verify(() => mockArticleDatabase.select(mockArticlesTable)).called(1);
//     });

//     test('put returns the inserted value', () async {
//       final article = Article(
//         guid: 'test',
//         ownerId: 'owner1',
//         createdAt: DateTime.now(),
//         title: 'title',
//         content: 'content',
//         authorName: 'author1',
//         sourceId: 'source1',
//       );

//       final result = await articleDatastore.put(article);

//       expect(result, isNotNull);
//       expect(result.guid, 'test');
//       expect(result.title, 'title');

//       verify(() => mockBatch.insert(mockArticlesTable, any())).called(1);
//     });

//     test('put with source inserts source', () async {
//       final article = Article(
//         guid: 'test',
//         ownerId: 'owner1',
//         createdAt: DateTime.now(),
//         title: 'title',
//         content: 'content',
//         authorName: 'author1',
//         sourceId: 'source1',
//         source: Source(id: 'source1', name: 'Source 1'),
//       );

//       final result = await articleDatastore.put(article);

//       expect(result, isNotNull);
//       expect(result.guid, 'test');
//       expect(result.title, 'title');

//       verify(
//         () => mockBatch.insertAllOnConflictUpdate(mockSourcesTable, any()),
//       ).called(1);
//       verify(() => mockBatch.insert(mockArticlesTable, any())).called(1);
//     });

//     test('putAll completes successfully', () async {
//       final data = [
//         Article(
//           guid: 'test1',
//           ownerId: 'owner1',
//           createdAt: DateTime.now(),
//           title: 'title1',
//           content: 'content1',
//           authorName: 'author1',
//           sourceId: 'source1',
//         ),
//       ];

//       await articleDatastore.putAll(data);

//       verify(() => mockBatch.insertAll(mockArticlesTable, any())).called(1);
//     });

//     test('putAll with empty list does nothing', () async {
//       await articleDatastore.putAll([]);

//       verifyNever(() => mockArticleDatabase.batch(any()));
//     });

//     test('delete returns deleted article', () async {
//       final articleData = ArticleData(
//         guid: 'test',
//         ownerId: 'owner1',
//         createdAt: DateTime.now(),
//         isFeatured: false,
//         title: 'title',
//         content: 'content',
//         authorName: 'author1',
//         sourceId: 'source1',
//       );
//       when(
//         () => mockSelectStatement.getSingleOrNull(),
//       ).thenAnswer((_) async => articleData);
//       when(() => mockDeleteStatement.go()).thenAnswer((_) async => 1);

//       final result = await articleDatastore.delete('test');

//       expect(result, isNotNull);
//       expect(result.guid, 'test');
//       verify(() => mockArticleDatabase.delete(mockArticlesTable)).called(1);
//     });

//     test('delete throws exception when article not found', () async {
//       when(() => mockDeleteStatement.go()).thenAnswer((_) async => 0);

//       expect(
//         () => articleDatastore.delete('test'),
//         throwsA(isA<DeleteFailedException>()),
//       );
//     });

//     test('count returns correct number of articles', () async {
//       final data = [
//         ArticleData(
//           guid: 'test1',
//           ownerId: 'owner1',
//           createdAt: DateTime.now(),
//           isFeatured: false,
//         ),
//         ArticleData(
//           guid: 'test2',
//           ownerId: 'owner2',
//           createdAt: DateTime.now(),
//           isFeatured: false,
//         ),
//       ];
//       when(() => mockSelectStatement.get()).thenAnswer((_) async => data);

//       final result = await articleDatastore.count(const ArticleQueryParams());

//       expect(result, 2);
//     });

//     test('search returns correct pagination data', () async {
//       final data = [
//         ArticleData(
//           guid: 'test1',
//           ownerId: 'owner1',
//           createdAt: DateTime.now(),
//           isFeatured: false,
//         ),
//       ];
//       when(() => mockSelectStatement.get()).thenAnswer((_) async => data);
//       when(
//         () => mockSelectStatement.limit(any(), offset: any(named: 'offset')),
//       ).thenReturn(mockSelectStatement);

//       final result = await articleDatastore.search(
//         const ArticleQueryParams(limit: 1, offset: 0),
//       );

//       expect(result.data, hasLength(1));
//       expect(result.total, 1);
//       expect(result.offset, 0);
//       expect(result.limit, 1);
//     });

//     test('search with sources filter applies where clause', () async {
//       const params = ArticleQueryParams(sources: ['source1', 'source2']);
//       when(
//         () => mockSelectStatement.where(any()),
//       ).thenReturn(mockSelectStatement);
//       when(() => mockSelectStatement.get()).thenAnswer((_) async => []);

//       await articleDatastore.search(params);

//       verify(
//         () => mockSelectStatement.where(any()),
//       ).called(greaterThanOrEqualTo(1));
//     });

//     test('search with query filter applies text search where clause', () async {
//       const params = ArticleQueryParams(query: 'test query');
//       when(
//         () => mockSelectStatement.where(any()),
//       ).thenReturn(mockSelectStatement);
//       when(() => mockSelectStatement.get()).thenAnswer((_) async => []);

//       await articleDatastore.search(params);

//       verify(
//         () => mockSelectStatement.where(any()),
//       ).called(greaterThanOrEqualTo(1));
//     });

//     test('search with sortBy applies order by clause', () async {
//       const params = ArticleQueryParams(sortBy: ArticleSortOptions.createdAt);
//       when(
//         () => mockSelectStatement.orderBy(any()),
//       ).thenReturn(mockSelectStatement);
//       when(() => mockSelectStatement.get()).thenAnswer((_) async => []);

//       await articleDatastore.search(params);

//       verify(
//         () => mockSelectStatement.orderBy(any()),
//       ).called(greaterThanOrEqualTo(1));
//     });

//     test('search with orderMode applies order by clause', () async {
//       const params = ArticleQueryParams(orderMode: OrderMode.descending);
//       when(
//         () => mockSelectStatement.orderBy(any()),
//       ).thenReturn(mockSelectStatement);
//       when(() => mockSelectStatement.get()).thenAnswer((_) async => []);

//       await articleDatastore.search(params);

//       verify(
//         () => mockSelectStatement.orderBy(any()),
//       ).called(greaterThanOrEqualTo(1));
//     });

//     test('latestNews calls search with correct params', () async {
//       const params = ArticleQueryParams(limit: 5, offset: 0);
//       when(
//         () => articleDatastore.search(any()),
//       ).thenAnswer((_) async => const OffsetLimitPagination.empty());

//       await articleDatastore.latestNews(params);

//       verify(
//         () => articleDatastore.search(
//           const ArticleQueryParams(
//             limit: 5,
//             offset: 0,
//             orderMode: OrderMode.descending,
//             sortBy: ArticleSortOptions.createdAt,
//           ),
//         ),
//       ).called(1);
//     });

//     test('popularNews calls search with correct params', () async {
//       const params = ArticleQueryParams(limit: 5, offset: 0);
//       when(
//         () => articleDatastore.search(any()),
//       ).thenAnswer((_) async => const OffsetLimitPagination.empty());

//       await articleDatastore.popularNews(params);

//       verify(
//         () => articleDatastore.search(
//           const ArticleQueryParams(
//             limit: 5,
//             offset: 0,
//             orderMode: OrderMode.descending,
//             sortBy: ArticleSortOptions.data,
//           ),
//         ),
//       ).called(1);
//     });

//     test('topNews calls search with correct params', () async {
//       const params = ArticleQueryParams(limit: 5, offset: 0);
//       when(
//         () => articleDatastore.search(any()),
//       ).thenAnswer((_) async => const OffsetLimitPagination.empty());

//       await articleDatastore.topNews(params);

//       verify(
//         () => articleDatastore.search(
//           const ArticleQueryParams(
//             limit: 5,
//             offset: 0,
//             orderMode: OrderMode.descending,
//             sortBy: ArticleSortOptions.data,
//           ),
//         ),
//       ).called(1);
//     });

//     test('trendingNews calls search with correct params', () async {
//       const params = ArticleQueryParams(limit: 5, offset: 0);
//       when(
//         () => articleDatastore.search(any()),
//       ).thenAnswer((_) async => const OffsetLimitPagination.empty());

//       await articleDatastore.trendingNews(params);

//       verify(
//         () => articleDatastore.search(
//           const ArticleQueryParams(
//             limit: 5,
//             offset: 0,
//             orderMode: OrderMode.descending,
//             sortBy: ArticleSortOptions.updatedAt,
//           ),
//         ),
//       ).called(1);
//     });

//     test('mostReadNews calls search with correct params', () async {
//       const params = ArticleQueryParams(limit: 5, offset: 0);
//       when(
//         () => articleDatastore.search(any()),
//       ).thenAnswer((_) async => const OffsetLimitPagination.empty());

//       await articleDatastore.mostReadNews(params);

//       verify(
//         () => articleDatastore.search(
//           const ArticleQueryParams(
//             limit: 5,
//             offset: 0,
//             orderMode: OrderMode.descending,
//             sortBy: ArticleSortOptions.data,
//           ),
//         ),
//       ).called(1);
//     });

//     test('highlight calls search with correct params', () async {
//       const params = ArticleQueryParams(limit: 5, offset: 0);
//       when(
//         () => articleDatastore.search(any()),
//       ).thenAnswer((_) async => const OffsetLimitPagination.empty());

//       await articleDatastore.highlight(params);

//       verify(
//         () => articleDatastore.search(
//           const ArticleQueryParams(
//             limit: 5,
//             offset: 0,
//             orderMode: OrderMode.descending,
//             sortBy: ArticleSortOptions.data,
//           ),
//         ),
//       ).called(1);
//     });
//   });
// }
