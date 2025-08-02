/// An interface for standardized database operations.
abstract class Database<T> {
  /// Executes a read operation on the database.
  ///
  /// [callback] A function that performs the read operation.
  /// Returns the result of the operation.
  Future<R> read<R>(Future<R> Function(T) callback);

  /// Executes a write operation on the database.
  ///
  /// [callback] A function that performs the write operation.
  /// Returns the result of the operation.
  Future<R> write<R>(Future<R> Function(T) callback);
}
