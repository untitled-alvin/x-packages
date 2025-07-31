/// Base class for query parameters.
///
/// This class encapsulates common query parameters like pagination.
/// It can be extended to add specific parameters for different data types.
class QueryParams {
  /// Creates a new instance of [QueryParams].
  const QueryParams({
    this.limit,
    this.offset,
  });

  /// Default query to select all records.
  static const queryAll = QueryParams();

  /// Maximum number of results to return.
  final int? limit;

  /// Number of results to skip.
  final int? offset;
}
