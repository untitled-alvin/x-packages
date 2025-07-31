// import 'package:isar/isar.dart';
// import 'package:test/test.dart';
// import 'package:universal_datastores/src/domain/datastore/entities/article_entity.dart';
// import 'package:universal_datastores/src/infrastructure/datastore/repositories/isar_datastore_repository.dart';

// void main() {
//   late Isar isar;
//   late IsarDatastore<Article> datastore;

//   setUp(() async {
//     await Isar.initializeIsarCore(download: true);
//     isar = await Isar.open(
//       [ArticleSchema],
//       directory: '',
//     );
//     datastore = IsarDatastore<Article>(isar);
//   });

//   tearDown(() async {
//     await isar.close(deleteFromDisk: true);
//   });

//   test('create and get all articles', () async {
//     final article = Article()
//       ..title = 'Test Title'
//       ..content = 'Test Content';

//     await datastore.create(article);

//     final articles = await datastore.getAll();
//     expect(articles.length, 1);
//     expect(articles.first.title, 'Test Title');
//   });

//   test('get article by id', () async {
//     final article = Article()
//       ..title = 'Test Title'
//       ..content = 'Test Content';
//     await datastore.create(article);

//     final retrievedArticle = await datastore.getById(article.id);
//     expect(retrievedArticle, isNotNull);
//     expect(retrievedArticle!.title, 'Test Title');
//   });

//   test('update article', () async {
//     final article = Article()
//       ..title = 'Test Title'
//       ..content = 'Test Content';
//     await datastore.create(article);

//     article.title = 'Updated Title';
//     await datastore.update(article);

//     final updatedArticle = await datastore.getById(article.id);
//     expect(updatedArticle, isNotNull);
//     expect(updatedArticle!.title, 'Updated Title');
//   });

//   test('delete article', () async {
//     final article = Article()
//       ..title = 'Test Title'
//       ..content = 'Test Content';
//     await datastore.create(article);

//     await datastore.delete(article.id);

//     final deletedArticle = await datastore.getById(article.id);
//     expect(deletedArticle, isNull);
//   });

//   test('search articles', () async {
//     final article1 = Article()
//       ..title = 'First Article'
//       ..content = 'Some content';
//     final article2 = Article()
//       ..title = 'Second Article'
//       ..content = 'More content';
//     await datastore.create(article1);
//     await datastore.create(article2);

//     // Note: The current search implementation is basic and returns all items.
//     // This test will need to be updated if the search logic is improved.
//     final searchResults = await datastore.search('First');
//     expect(searchResults.length, 2);
//   });
// }
