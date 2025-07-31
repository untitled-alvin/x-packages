/// Represents a record in the data store.
/// Each record must have
/// a unique identifier (`guid`),
/// an optional `modifiedId`,
/// an `ownerId` to indicate ownership,
/// and timestamps for creation (`createdAt`)
/// and last update (`updatedAt`).
/// This interface is used to define the structure of records stored
/// in the data store.
abstract class Record {
  /// A globally unique identifier for the record.
  /// This identifier should be unique across all records in the data store.
  String get guid;

  /// An optional identifier for the last modification of the record.
  String? get modifiedId;

  /// The identifier of the owner of the record.
  String get ownerId;

  /// The date and time when the article was created
  DateTime get createdAt;

  /// The date and time when the article was last updated
  DateTime? get updatedAt;
}
