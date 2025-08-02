import 'package:universal_datastores/src/article_datastore/models/models.dart';
import 'package:universal_datastores/src/datastore.dart';

export 'package:universal_datastores/src/article_datastore/models/models.dart';

/// {@template news_store}
/// Local data source that manages Article objects.
///
/// This class abstracts the data access layer in the Clean Architecture,
/// serving as a local data source for Article entities.
/// {@endtemplate}
abstract class ArticlesDatastore extends Datastore<Article> {
  /// Searches for items that match the given query.
  Future<OffsetLimitPagination<Article>> search(QueryParams params);
}
