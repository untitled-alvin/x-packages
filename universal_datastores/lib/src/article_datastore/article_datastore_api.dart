// ignore_for_file: always_use_package_imports, document_ignores

import 'package:universal_datastores/src/universal_datastores.dart'
    show OffsetLimitPagination;
import 'models/models.dart';

/// {@template news_store}
/// Local data source that manages Article objects.
///
/// This class abstracts the data access layer in the Clean Architecture,
/// serving as a local data source for Article entities.
/// {@endtemplate}
abstract class ArticlesDatastoreApi {
  /// Searches for items that match the given query.
  Future<OffsetLimitPagination<Article>> search(ArticleQueryParams params);

  /// Returns the item with the given `id`.
  Future<Article?> get(String id);

  /// Stores multiple objects at once.
  ///
  /// This might update existing objects if they have the same ID.
  /// If the list is empty, this method does nothing.
  Future<void> putAll(List<Article> params);

  /// Stores a single object.
  ///
  /// Returns the updated object.
  Future<Article> put(Article params);
}
