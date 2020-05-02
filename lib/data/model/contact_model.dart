import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  @JsonKey(nullable: false)
  final String id;
  @JsonKey(nullable: false)
  final String name;
  @JsonKey(nullable: false)
  final String phone;
  @JsonKey(nullable: false)
  final double height;
  @JsonKey(nullable: false)
  final String biography;
  @JsonKey(nullable: false)
  final TemperamentModel temperament;
  @JsonKey(nullable: false)
  final EducationPeriodModel educationPeriod;

  const ContactModel({
    @required this.id,
    @required this.name,
    @required this.phone,
    @required this.height,
    @required this.biography,
    @required this.temperament,
    @required this.educationPeriod,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}

enum TemperamentModel { sanguine, choleric, phlegmatic, melancholic }

@JsonSerializable()
class EducationPeriodModel {
  @JsonKey(nullable: false)
  final DateTime start;
  @JsonKey(nullable: false)
  final DateTime end;

  const EducationPeriodModel({
    @required this.start,
    @required this.end,
  });

  factory EducationPeriodModel.fromJson(Map<String, dynamic> json) =>
      _$EducationPeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationPeriodModelToJson(this);
}
