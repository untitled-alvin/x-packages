import 'package:isar/isar.dart' show Isar;
import 'package:universal_datastores/universal_datastores.dart'
    show DatastoreException;

/// An interface for standardized database operations.
abstract class Database<T> {
  /// Executes a read operation on the database.
  ///
  /// [callback] A function that performs the read operation.
  /// Returns the result of the operation.
  R read<R>(R Function(T) callback);

  /// Executes a write operation on the database.
  ///
  /// [callback] A function that performs the write operation.
  /// Returns the result of the operation.
  R write<R>(R Function(T) callback);
}

/// A mixin that provides transaction handling with metrics and logging.
///
/// Implements database operations with performance tracking and error logging.
class IsarDatabase implements Database<Isar> {
  /// Implements database operations with performance tracking and error logging.
  IsarDatabase({
    required String directory,
  }) : _isar = Isar.open(directory: directory, schemas: const []);

  /// @nodoc
  IsarDatabase.injectIsar({
    required Isar isar,
  }) : _isar = isar;

  /// Gets the database instance to perform operations on.
  late final Isar _isar;

  /// @nodoc
  // static const schemas = [];

  @override
  R read<R>(R Function(Isar) callback) {
    try {
      final result = _isar.read(callback);
      return result;
    } on DatastoreException {
      rethrow;
    } catch (e, st) {
      throw DatastoreException.unexpected(
        'Unexpected error during read operation: \n$e',
        error: e,
        stackTrace: st,
      );
    }
  }

  @override
  R write<R>(R Function(Isar) callback) {
    try {
      final result = _isar.write(callback);
      return result;
    } on DatastoreException {
      rethrow;
    } catch (e, st) {
      throw DatastoreException.unexpected(
        'Unexpected error during write operation: \n$e',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Throws a [DatastoreException] if an exception occurs.
  R readNullable<R>(R Function(Isar) callback) => read(callback);

  /// Throws a [DatastoreException] if an exception occurs.
  R readNonNull<R>(R? Function(Isar) callback) {
    bool isNullable<T>() => null is T;
    if (isNullable<R>()) {
      throw DatastoreException.unexpected(
        'The readNonNull method cannot be used with nullable types.',
      );
    }
    final result = readNullable(callback);
    if (result == null) {
      throw DatastoreException.notFound('No data found for the given query.');
    }
    return result;
  }

  /// Throws a [DatastoreException] if an exception occurs.
  void clear() {
    write((isar) => isar.clear());
  }

  /// Closes the database connection.
  ///
  /// If [deleteFromDisk] is true, the database file will be deleted.
  /// Throws a [DatastoreException] if an exception occurs.
  void close({bool deleteFromDisk = false}) {
    try {
      final isClosed = _isar.close(deleteFromDisk: deleteFromDisk);
      if (!isClosed) {
        throw DatastoreException.internalError(
          'Failed to close database connection',
        );
      }
    } on DatastoreException {
      rethrow;
    } catch (e, st) {
      throw DatastoreException.internalError(
        'Unexpected error during close operation: \n$e',
        error: e,
        stackTrace: st,
      );
    }
  }

  /// Dispose the database connection.
  ///
  /// Throws a [DatastoreException] if an exception occurs.
  void dispose() => close();
}

// /// A mixin that provides transaction handling with metrics and logging.
// ///
// /// Implements database operations with performance tracking and error logging.
// mixin IsarDatabaseTransactionMixin implements IsarDatabase {
//   /// Gets the database instance to perform operations on.
//   Isar get database;

//   @override
//   R read<R>(R Function(Isar) callback) => database.read(callback);

//   @override
//   R write<R>(R Function(Isar) callback) => database.write(callback);

//   @override
//   R readNullable<R>(R Function(Isar) callback) => database.readNullable(callback);

//   @override
//   R readNonNull<R>(R? Function(Isar) callback) => database.readNonNull(callback);

//   @override
//   void clear() => database.clear();

//   @override
//   void close({bool deleteFromDisk = false}) => database.close(deleteFromDisk: deleteFromDisk);

//   @override
//   void dispose() => database.dispose();
// }
