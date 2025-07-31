// ignore_for_file: depend_on_referenced_packages, public_member_api_docs, document_ignores, lines_longer_than_80_chars

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';

/// {@template page}
/// Page model
/// {@endtemplate}
@immutable
abstract class Page<T> {
  bool get hasNext;
  List<T> get data;
}

// Offset-Limit Pagination Model
// 1. Offset-Limit Pagination
// GET /api/items?offset=20&limit=10
// {
//   "items": [
//     { "id": 21, "name": "Item 21", "description": "Description of item 21" },
//     { "id": 22, "name": "Item 22", "description": "Description of item 22" },
//     { "id": 23, "name": "Item 23", "description": "Description of item 23" },
//     { "id": 24, "name": "Item 24", "description": "Description of item 24" },
//     { "id": 25, "name": "Item 25", "description": "Description of item 25" },
//     { "id": 26, "name": "Item 26", "description": "Description of item 26" },
//     { "id": 27, "name": "Item 27", "description": "Description of item 27" },
//     { "id": 28, "name": "Item 28", "description": "Description of item 28" },
//     { "id": 29, "name": "Item 29", "description": "Description of item 29" },
//     { "id": 30, "name": "Item 30", "description": "Description of item 30" }
//   ],
//   "pagination": {
//     "offset": 20,
//     "limit": 10,
//     "total": 100,
//     "hasNext": true
//   }
// }
@immutable
class OffsetLimitPagination<T> implements Page<T> {
  const OffsetLimitPagination({
    required this.data,
    required this.offset,
    required this.limit,
    required this.total,
  }) : assert(offset >= 0, 'Min is 0.'),
       hasNext = offset + limit < total;

  @override
  final bool hasNext;

  @override
  final List<T> data;

  final int offset;

  final int limit;

  final int total;

  @override
  bool operator ==(covariant OffsetLimitPagination<T> other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.hasNext == hasNext &&
        listEquals(other.data, data) &&
        other.offset == offset &&
        other.limit == limit &&
        other.total == total;
  }

  @override
  int get hashCode {
    return hasNext.hashCode ^
        data.hashCode ^
        offset.hashCode ^
        limit.hashCode ^
        total.hashCode;
  }
}
