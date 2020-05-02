import 'package:contacts_flutter/data/db/database.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';

class ContactMapper {
  Contact mapToDomain(ContactEntity entity) {
    return Contact(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      height: entity.height,
      biography: entity.biography,
      temperament: entity.temperament,
      educationPeriod:
      EducationPeriod(start: entity.educationStart, end: entity.educationEnd),
    );
  }

  ContactEntity mapToEntity(Contact contact) {
    return ContactEntity(
        id: contact.id,
        name: contact.name,
        phone: contact.phone,
        height: contact.height,
        biography: contact.biography,
        temperament: contact.temperament,
        educationStart: contact.educationPeriod.start,
        educationEnd: contact.educationPeriod.end
    );
  }
}
