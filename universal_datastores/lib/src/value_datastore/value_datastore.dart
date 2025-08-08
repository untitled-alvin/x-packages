export 'drift_value_datastore.dart' show DriftValueDatastore, ValueDatabase;

/// {@template key_value}
/// A model representing the author of an article.
/// {@endtemplate}
class KeyValue {
  /// {@macro key_value}
  KeyValue({
    required this.key,
    required this.value,
    this.description,
  });

  /// The unique identifier of the author.
  final String key;

  /// The name of the author.
  final String value;

  /// The description of the author.
  final String? description;
}

/// {@template value_datastore}
/// The API for the values datastore.
/// {@endtemplate}
abstract class ValueDatastore {
  /// Returns the item with the given `id`.
  /// * Throws a [Exception] if the get fails.
  Future<KeyValue?> get(String id);

  /// Stores a single object, updating it if it already exists.
  ///
  /// Returns the updated object.
  /// * Throws a [Exception] if the operation fails.
  Future<KeyValue> put(String key, String value, {String? description});

  /// @nodoc
  Future<List<KeyValue>> getAll();

  /// Stores multiple objects at once.
  ///
  /// This might update existing objects if they have the same ID.
  /// If the list is empty, this method does nothing.
  /// * Throws a [Exception] if the operation fails.
  Future<void> putAll(List<KeyValue> data);

  /// Deletes the item with the given `id`.
  /// * Throws a [Exception] if the delete fails.
  Future<void> delete(String id);
}
