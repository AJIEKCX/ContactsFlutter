import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:moor/moor.dart';

class TemperamentConverter extends TypeConverter<Temperament, String> {
  @override
  Temperament mapToDart(String fromDb) {
    switch(fromDb) {
      case 'Temperament.sanguine':
        return Temperament.sanguine;
      case 'Temperament.choleric':
        return Temperament.choleric;
      case 'Temperament.phlegmatic':
        return Temperament.phlegmatic;
      case 'Temperament.melancholic':
        return Temperament.melancholic;
    }
    throw ArgumentError();
  }

  @override
  String mapToSql(Temperament value) {
    return value.toString();
  }
}