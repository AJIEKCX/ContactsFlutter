import 'package:contacts_flutter/data/db/converter/temperament_converter.dart';
import 'package:contacts_flutter/data/db/dao/contacts_dao.dart';
import 'package:contacts_flutter/data/entity/contact_entity.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@UseMoor(tables: [ContactEntities], daos: [ContactDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;
}
