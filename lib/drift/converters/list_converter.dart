import 'dart:convert';

import 'package:drift/drift.dart';

class DatabaseSetConverter extends TypeConverter<Set<String>, String> {
  const DatabaseSetConverter();

  @override
  Set<String> fromSql(String fromDb) {
    final list = json.decode(fromDb) as List;

    return list.map((e) => e as String).toSet();
  }

  @override
  String toSql(Set<String> value) {
    return json.encode(value.toList());
  }
}
