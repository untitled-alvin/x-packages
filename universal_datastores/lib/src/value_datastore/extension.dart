part of 'drift_value_datastore.dart';

extension on KeyValue {
  /// Converts the Source object to a Drift-compatible SourcesCompanion object.
  ValuesCompanion toCompanion() {
    return ValuesCompanion.insert(
      key: key,
      value: value,
      description: Value(description),
    );
  }
}

extension on KeyValueData {
  /// Converts the Source object to a Drift-compatible SourcesCompanion object.
  KeyValue toModel() {
    return KeyValue(
      key: key,
      value: value,
      description: description,
    );
  }
}
