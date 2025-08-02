/// Base class for query parameters.
///
/// This class encapsulates common query parameters like pagination.
/// It can be extended to add specific parameters for different data types.
class QueryParams {
  /// Creates a new instance of [QueryParams].
  const QueryParams({this.limit, this.offset});

  /// Default query to select all records.
  static const queryAll = QueryParams();

  /// Maximum number of results to return.
  final int? limit;

  /// Number of results to skip.
  final int? offset;
}

/// Offset-Limit Pagination Model
/// This class represents a paginated response for queries that support offset and limit.
/// It includes the data for the current page, the offset, limit, total number of items, and whether there are more items available.
/// It is designed to be used with queries that return a list of items, allowing for efficient pagination in
///
/// Offset-Limit Pagination Model
/// 1. Offset-Limit Pagination
/// GET /api/items?offset=20&limit=10
/// {
///   "items": [
///     { "id": 21, "name": "Item 21", "description": "Description of item 21" },
///     { "id": 22, "name": "Item 22", "description": "Description of item 22" },
///     { "id": 23, "name": "Item 23", "description": "Description of item 23" },
///     { "id": 24, "name": "Item 24", "description": "Description of item 24" },
///     { "id": 25, "name": "Item 25", "description": "Description of item 25" },
///     { "id": 26, "name": "Item 26", "description": "Description of item 26" },
///     { "id": 27, "name": "Item 27", "description": "Description of item 27" },
///     { "id": 28, "name": "Item 28", "description": "Description of item 28" },
///     { "id": 29, "name": "Item 29", "description": "Description of item 29" },
///     { "id": 30, "name": "Item 30", "description": "Description of item 30" }
///   ],
///   "pagination": {
///     "offset": 20,
///     "limit": 10,
///     "total": 100,
///     "hasNext": true
///   }
/// }
class OffsetLimitPagination<T> {
  /// Creates a new instance of [OffsetLimitPagination].
  const OffsetLimitPagination({
    required this.data,
    required this.offset,
    required this.limit,
    required this.total,
  }) : assert(offset >= 0, 'Min is 0.'),
       hasNext = offset + limit < total;

  /// Creates a new instance of [OffsetLimitPagination] with an empty data list.
  const OffsetLimitPagination.empty()
    : data = const [],
      offset = 0,
      limit = 0,
      total = 0,
      hasNext = false;

  /// The list of items in the current page.
  final List<T> data;

  /// The offset from which to start returning results.
  final int offset;

  /// The maximum number of results to return.
  final int limit;

  /// The total number of items available.
  final int total;

  /// Indicates whether there are more items available after the current page.
  final bool hasNext;
}

/// Defines the contract for a data store that provides basic CRUD operations
/// for a generic type `T`.
abstract class Datastore<T> {
  /// Returns the item with the given `id`.
  Future<T?> get(String id);

  /// Stores multiple objects at once.
  ///
  /// This might update existing objects if they have the same ID.
  /// If the list is empty, this method does nothing.
  Future<void> putAll(List<T> objects);

  /// Stores a single object.
  ///
  /// Returns the updated object.
  Future<T> put(T object);

  /// Deletes an object by its [id].
  ///
  /// Returns the deleted object.
  Future<T> delete(String id);
}
