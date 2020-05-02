import 'package:contacts_flutter/data/db/converter/temperament_converter.dart';
import 'package:moor/moor.dart';

@DataClassName('ContactEntity')
class ContactEntities extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get phone => text()();

  RealColumn get height => real()();

  TextColumn get biography => text()();

  TextColumn get temperament => text().map(TemperamentConverter())();

  DateTimeColumn get educationStart => dateTime()();

  DateTimeColumn get educationEnd => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}