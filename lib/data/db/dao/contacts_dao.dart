import 'package:contacts_flutter/data/db/database.dart';
import 'package:contacts_flutter/data/entity/contact_entity.dart';
import 'package:moor/moor.dart';

part 'contacts_dao.g.dart';

@UseDao(tables: [ContactEntities])
class ContactDao extends DatabaseAccessor<AppDatabase> with _$ContactDaoMixin {
  final AppDatabase database;

  ContactDao(this.database): super(database);

  Future<List<ContactEntity>> getContacts() => select(contactEntities).get();

  Future<void> replaceContacts(List<ContactEntity> list) {
    return transaction(() async {
      await delete(contactEntities).go();
      await batch((batch) => batch.insertAll(contactEntities, list));
    });
  }
}
