/// This file is part of the universal_datastores package.
class DatastoreException implements Exception {
  /// Creates a new instance of [DatastoreException].
  ///
  /// [message] The error message.
  /// [error] The stack trace at the time of the exception.
  DatastoreException(this.code, this.message, {this.error, this.stackTrace});

  /// @nodoc
  /// Server error
  DatastoreException.internalError(
    this.message, {
    this.error,
    this.stackTrace,
  }) : code = 'internal_error';

  /// @nodoc
  DatastoreException.unexpected(
    this.message, {
    this.error,
    this.stackTrace,
  }) : code = 'unexpected';

  /// @nodoc
  DatastoreException.badRequest(
    this.message, {
    this.error,
    this.stackTrace,
  }) : code = 'bad_request';

  /// @nodoc
  DatastoreException.unauthorized(
    this.message, {
    this.error,
    this.stackTrace,
  }) : code = 'unauthorized';

  /// @nodoc
  DatastoreException.notFound(
    this.message, {
    this.error,
    this.stackTrace,
  }) : code = 'not_found';

  /// @nodoc
  DatastoreException.forbidden(
    this.message, {
    this.error,
    this.stackTrace,
  }) : code = 'forbidden';

  /// @nodoc
  DatastoreException.invalidArgument(
    this.message, {
    this.error,
    this.stackTrace,
  }) : code = 'invalid_argument';

  /// The error code.
  final String code;

  /// The error message.
  final String message;

  /// The stack trace at the time of the exception.
  final Object? error;

  /// The stack trace at the time of the exception.
  final Object? stackTrace;

  @override
  // throw Exception('Read operation failed: $e');
  String toString() => 'DatastoreException: $code\n$message\n$error';
}
