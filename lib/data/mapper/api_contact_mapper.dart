import 'package:contacts_flutter/data/model/contact_model.dart';
import 'package:contacts_flutter/domain/entity/contact.dart';

class ApiContactMapper {
  Contact map(ContactModel model) {
    return Contact(
      id: model.id,
      name: model.name,
      phone: model.phone,
      height: model.height,
      biography: model.biography,
      temperament: _mapTemperament(model.temperament),
      educationPeriod: _mapEducationPeriod(model.educationPeriod),
    );
  }

  Temperament _mapTemperament(TemperamentModel model) {
    switch (model) {
      case TemperamentModel.sanguine:
        return Temperament.sanguine;
      case TemperamentModel.choleric:
        return Temperament.choleric;
      case TemperamentModel.phlegmatic:
        return Temperament.phlegmatic;
      case TemperamentModel.melancholic:
        return Temperament.melancholic;
    }
    throw ArgumentError('Unexpected TemperamentModel type');
  }

  EducationPeriod _mapEducationPeriod(EducationPeriodModel model) {
    return EducationPeriod(start: model.start, end: model.end);
  }
}
