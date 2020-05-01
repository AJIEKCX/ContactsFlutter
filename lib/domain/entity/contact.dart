import 'package:flutter/foundation.dart';

@immutable
class Contact {
  final String id;
  final String name;
  final String phone;

  const Contact({
    @required this.id,
    @required this.name,
    @required this.phone,
  });
}
