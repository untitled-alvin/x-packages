import 'package:universal_datastores/universal_datastores.dart';

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

/// Imports a list of article JSON objects into the database.
///
/// Returns the number of articles successfully imported.
/// Throws a [DatastoreException] if the import fails.
// Future<int> importJson(List<Map<String, dynamic>> json);

// /// Imports articles from a JSON string.
// ///
// /// The [jsonString] must be a valid array of article objects.
// /// Returns the number of articles successfully imported.
// /// Throws a [DatastoreException] if the import fails or if the JSON is invalid.
// Future<int> importJsonString(String jsonString);

/// Defines the contract for a data store that provides basic CRUD operations
/// for a generic type `T`.
abstract class IsarDatastore<T extends Record> extends Datastore<T> {
  /// {@macro news_store}
  /// Creates a new [Datastore] with the provided database instance.
  ///
  /// The [database] parameter is required and must be an instance of [IsarDatabase].
  IsarDatastore({required this.database});

  /// The database instance used for all operations.
  final IsarDatabase database;

  /// Returns the item with the given `id`.
  @override
  Future<T?> get(String id) async {
    return database.read((isar) => isar.collection<String, T>().get(id));
  }

  /// Stores multiple objects at once.
  ///
  /// This might update existing objects if they have the same ID.
  /// If the list is empty, this method does nothing.
  @override
  Future<void> putAll(List<T> objects) async {
    if (objects.isNotEmpty) {
      database.write((isar) => isar.collection<String, T>().putAll(objects));
    }
  }

  /// Returns the item with the given `id`.
  Future<T> getNotNull(String id) async {
    final result = await get(id);
    if (result == null) {
      throw DatastoreException.notFound('$T with id $id not found');
    }
    return result;
  }

  /// Stores a single object.
  ///
  /// Returns the updated object.
  @override
  Future<T> put(T object) async {
    return database.write((isar) {
      isar.collection<String, T>().put(object);
      return object;
    });
  }

  /// Deletes an article by its [id].
  ///
  /// Returns the deleted article.
  /// Throws a [DatastoreException.notFound] if the article does not exist.
  /// Throws a [DatastoreException.unexpected] if the deletion fails.
  @override
  Future<T> delete(String id) async {
    return database.write((isar) {
      final object = isar.collection<String, T>().get(id);
      if (object == null) {
        throw DatastoreException.notFound('$T with id $id not found');
      }

      final deleted = isar.collection<String, T>().delete(id);
      if (!deleted) {
        throw DatastoreException.unexpected('Failed to delete $T with id $id');
      }

      return object;
    });
  }
}

/// Base class for a data store that provides basic CRUD operations.
///
/// This class defines the contract for a data store that can handle
/// generic types extending [Record].
///
/// It includes methods for getting, putting, and searching records.
/// It also provides a method to get a record by ID with a non-null guarantee.
/// Returns the item with the given `id`.
mixin DatastoreSearch<T extends Record> on IsarDatastore<T> {
  /// Searches for items that match the given query.
  Future<OffsetLimitPagination<T>> search(QueryParams params);
}
