// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ContactEntity extends DataClass implements Insertable<ContactEntity> {
  final String id;
  final String name;
  final String phone;
  final double height;
  final String biography;
  final Temperament temperament;
  final DateTime educationStart;
  final DateTime educationEnd;
  ContactEntity(
      {@required this.id,
      @required this.name,
      @required this.phone,
      @required this.height,
      @required this.biography,
      @required this.temperament,
      @required this.educationStart,
      @required this.educationEnd});
  factory ContactEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ContactEntity(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      height:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}height']),
      biography: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}biography']),
      temperament: $ContactEntitiesTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}temperament'])),
      educationStart: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}education_start']),
      educationEnd: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}education_end']),
    );
  }
  factory ContactEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ContactEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      height: serializer.fromJson<double>(json['height']),
      biography: serializer.fromJson<String>(json['biography']),
      temperament: serializer.fromJson<Temperament>(json['temperament']),
      educationStart: serializer.fromJson<DateTime>(json['educationStart']),
      educationEnd: serializer.fromJson<DateTime>(json['educationEnd']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'height': serializer.toJson<double>(height),
      'biography': serializer.toJson<String>(biography),
      'temperament': serializer.toJson<Temperament>(temperament),
      'educationStart': serializer.toJson<DateTime>(educationStart),
      'educationEnd': serializer.toJson<DateTime>(educationEnd),
    };
  }

  @override
  ContactEntitiesCompanion createCompanion(bool nullToAbsent) {
    return ContactEntitiesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      biography: biography == null && nullToAbsent
          ? const Value.absent()
          : Value(biography),
      temperament: temperament == null && nullToAbsent
          ? const Value.absent()
          : Value(temperament),
      educationStart: educationStart == null && nullToAbsent
          ? const Value.absent()
          : Value(educationStart),
      educationEnd: educationEnd == null && nullToAbsent
          ? const Value.absent()
          : Value(educationEnd),
    );
  }

  ContactEntity copyWith(
          {String id,
          String name,
          String phone,
          double height,
          String biography,
          Temperament temperament,
          DateTime educationStart,
          DateTime educationEnd}) =>
      ContactEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        height: height ?? this.height,
        biography: biography ?? this.biography,
        temperament: temperament ?? this.temperament,
        educationStart: educationStart ?? this.educationStart,
        educationEnd: educationEnd ?? this.educationEnd,
      );
  @override
  String toString() {
    return (StringBuffer('ContactEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('height: $height, ')
          ..write('biography: $biography, ')
          ..write('temperament: $temperament, ')
          ..write('educationStart: $educationStart, ')
          ..write('educationEnd: $educationEnd')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              phone.hashCode,
              $mrjc(
                  height.hashCode,
                  $mrjc(
                      biography.hashCode,
                      $mrjc(
                          temperament.hashCode,
                          $mrjc(educationStart.hashCode,
                              educationEnd.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ContactEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.height == this.height &&
          other.biography == this.biography &&
          other.temperament == this.temperament &&
          other.educationStart == this.educationStart &&
          other.educationEnd == this.educationEnd);
}

class ContactEntitiesCompanion extends UpdateCompanion<ContactEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<double> height;
  final Value<String> biography;
  final Value<Temperament> temperament;
  final Value<DateTime> educationStart;
  final Value<DateTime> educationEnd;
  const ContactEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.height = const Value.absent(),
    this.biography = const Value.absent(),
    this.temperament = const Value.absent(),
    this.educationStart = const Value.absent(),
    this.educationEnd = const Value.absent(),
  });
  ContactEntitiesCompanion.insert({
    @required String id,
    @required String name,
    @required String phone,
    @required double height,
    @required String biography,
    @required Temperament temperament,
    @required DateTime educationStart,
    @required DateTime educationEnd,
  })  : id = Value(id),
        name = Value(name),
        phone = Value(phone),
        height = Value(height),
        biography = Value(biography),
        temperament = Value(temperament),
        educationStart = Value(educationStart),
        educationEnd = Value(educationEnd);
  ContactEntitiesCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> phone,
      Value<double> height,
      Value<String> biography,
      Value<Temperament> temperament,
      Value<DateTime> educationStart,
      Value<DateTime> educationEnd}) {
    return ContactEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      height: height ?? this.height,
      biography: biography ?? this.biography,
      temperament: temperament ?? this.temperament,
      educationStart: educationStart ?? this.educationStart,
      educationEnd: educationEnd ?? this.educationEnd,
    );
  }
}

class $ContactEntitiesTable extends ContactEntities
    with TableInfo<$ContactEntitiesTable, ContactEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $ContactEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn(
      'phone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _heightMeta = const VerificationMeta('height');
  GeneratedRealColumn _height;
  @override
  GeneratedRealColumn get height => _height ??= _constructHeight();
  GeneratedRealColumn _constructHeight() {
    return GeneratedRealColumn(
      'height',
      $tableName,
      false,
    );
  }

  final VerificationMeta _biographyMeta = const VerificationMeta('biography');
  GeneratedTextColumn _biography;
  @override
  GeneratedTextColumn get biography => _biography ??= _constructBiography();
  GeneratedTextColumn _constructBiography() {
    return GeneratedTextColumn(
      'biography',
      $tableName,
      false,
    );
  }

  final VerificationMeta _temperamentMeta =
      const VerificationMeta('temperament');
  GeneratedTextColumn _temperament;
  @override
  GeneratedTextColumn get temperament =>
      _temperament ??= _constructTemperament();
  GeneratedTextColumn _constructTemperament() {
    return GeneratedTextColumn(
      'temperament',
      $tableName,
      false,
    );
  }

  final VerificationMeta _educationStartMeta =
      const VerificationMeta('educationStart');
  GeneratedDateTimeColumn _educationStart;
  @override
  GeneratedDateTimeColumn get educationStart =>
      _educationStart ??= _constructEducationStart();
  GeneratedDateTimeColumn _constructEducationStart() {
    return GeneratedDateTimeColumn(
      'education_start',
      $tableName,
      false,
    );
  }

  final VerificationMeta _educationEndMeta =
      const VerificationMeta('educationEnd');
  GeneratedDateTimeColumn _educationEnd;
  @override
  GeneratedDateTimeColumn get educationEnd =>
      _educationEnd ??= _constructEducationEnd();
  GeneratedDateTimeColumn _constructEducationEnd() {
    return GeneratedDateTimeColumn(
      'education_end',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        phone,
        height,
        biography,
        temperament,
        educationStart,
        educationEnd
      ];
  @override
  $ContactEntitiesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'contact_entities';
  @override
  final String actualTableName = 'contact_entities';
  @override
  VerificationContext validateIntegrity(ContactEntitiesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.phone.present) {
      context.handle(
          _phoneMeta, phone.isAcceptableValue(d.phone.value, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (d.height.present) {
      context.handle(
          _heightMeta, height.isAcceptableValue(d.height.value, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (d.biography.present) {
      context.handle(_biographyMeta,
          biography.isAcceptableValue(d.biography.value, _biographyMeta));
    } else if (isInserting) {
      context.missing(_biographyMeta);
    }
    context.handle(_temperamentMeta, const VerificationResult.success());
    if (d.educationStart.present) {
      context.handle(
          _educationStartMeta,
          educationStart.isAcceptableValue(
              d.educationStart.value, _educationStartMeta));
    } else if (isInserting) {
      context.missing(_educationStartMeta);
    }
    if (d.educationEnd.present) {
      context.handle(
          _educationEndMeta,
          educationEnd.isAcceptableValue(
              d.educationEnd.value, _educationEndMeta));
    } else if (isInserting) {
      context.missing(_educationEndMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContactEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ContactEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ContactEntitiesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.phone.present) {
      map['phone'] = Variable<String, StringType>(d.phone.value);
    }
    if (d.height.present) {
      map['height'] = Variable<double, RealType>(d.height.value);
    }
    if (d.biography.present) {
      map['biography'] = Variable<String, StringType>(d.biography.value);
    }
    if (d.temperament.present) {
      final converter = $ContactEntitiesTable.$converter0;
      map['temperament'] =
          Variable<String, StringType>(converter.mapToSql(d.temperament.value));
    }
    if (d.educationStart.present) {
      map['education_start'] =
          Variable<DateTime, DateTimeType>(d.educationStart.value);
    }
    if (d.educationEnd.present) {
      map['education_end'] =
          Variable<DateTime, DateTimeType>(d.educationEnd.value);
    }
    return map;
  }

  @override
  $ContactEntitiesTable createAlias(String alias) {
    return $ContactEntitiesTable(_db, alias);
  }

  static TypeConverter<Temperament, String> $converter0 =
      TemperamentConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ContactEntitiesTable _contactEntities;
  $ContactEntitiesTable get contactEntities =>
      _contactEntities ??= $ContactEntitiesTable(this);
  ContactDao _contactDao;
  ContactDao get contactDao => _contactDao ??= ContactDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [contactEntities];
}
