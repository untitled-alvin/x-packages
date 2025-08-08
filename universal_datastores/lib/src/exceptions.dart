/// {@template datastore_exception}
/// A base class for datastore exceptions.
/// {@endtemplate}
class DatastoreException implements Exception {
  /// {@macro datastore_exception}
  const DatastoreException(this.error, this.stackTrace);

  /// The error that occurred.
  final Object error;

  /// The stack trace of the error.
  final StackTrace stackTrace;
}

/// {@template get_failed_exception}
/// Thrown when a get operation fails.
/// {@endtemplate}
class GetFailedException extends DatastoreException {
  /// {@macro get_failed_exception}
  const GetFailedException(super.error, super.stackTrace);
}

/// {@template put_failed_exception}
/// Thrown when a put operation fails.
/// {@endtemplate}
class PutFailedException extends DatastoreException {
  /// {@macro put_failed_exception}
  const PutFailedException(super.error, super.stackTrace);
}

/// {@template delete_failed_exception}
/// Thrown when a delete operation fails.
/// {@endtemplate}
class DeleteFailedException extends DatastoreException {
  /// {@macro delete_failed_exception}
  const DeleteFailedException(super.error, super.stackTrace);
}
