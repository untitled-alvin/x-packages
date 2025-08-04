import 'package:universal_datastores/src/article_datastore/models/models.dart';
import 'package:universal_datastores/src/datastore.dart';

/// {@template articles_datastore_api}
/// The API for the articles datastore.
/// {@endtemplate}
abstract class ArticlesDatastoreApi extends Datastore<Article> {
  /// Searches for articles that match the given query.
  Future<OffsetLimitPagination<Article>> search(QueryParams params);

  /// Deletes an article by its [id].
  ///
  /// Returns the deleted article.
  Future<Article> delete(String id);
}
