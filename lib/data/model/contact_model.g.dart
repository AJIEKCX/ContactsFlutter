// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return ContactModel(
    id: json['id'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
    height: (json['height'] as num).toDouble(),
    biography: json['biography'] as String,
    temperament: _$enumDecode(_$TemperamentModelEnumMap, json['temperament']),
    educationPeriod: EducationPeriodModel.fromJson(
        json['educationPeriod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'height': instance.height,
      'biography': instance.biography,
      'temperament': _$TemperamentModelEnumMap[instance.temperament],
      'educationPeriod': instance.educationPeriod,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$TemperamentModelEnumMap = {
  TemperamentModel.sanguine: 'sanguine',
  TemperamentModel.choleric: 'choleric',
  TemperamentModel.phlegmatic: 'phlegmatic',
  TemperamentModel.melancholic: 'melancholic',
};

EducationPeriodModel _$EducationPeriodModelFromJson(Map<String, dynamic> json) {
  return EducationPeriodModel(
    start: DateTime.parse(json['start'] as String),
    end: DateTime.parse(json['end'] as String),
  );
}

Map<String, dynamic> _$EducationPeriodModelToJson(
        EducationPeriodModel instance) =>
    <String, dynamic>{
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };
