import 'package:flutter/foundation.dart';

@immutable
class Contact {
  final String id;
  final String name;
  final String phone;
  final double height;
  final String biography;
  final Temperament temperament;
  final EducationPeriod educationPeriod;

  const Contact({
    @required this.id,
    @required this.name,
    @required this.phone,
    @required this.height,
    @required this.biography,
    @required this.temperament,
    @required this.educationPeriod,
  });
}

enum Temperament { sanguine, choleric, phlegmatic, melancholic }

class EducationPeriod {
  final DateTime start;
  final DateTime end;

  const EducationPeriod({@required this.start, @required this.end});
}
