// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PersonalProfilewithcontact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalProfilewithc _$PersonalProfilewithcFromJson(
        Map<String, dynamic> json) =>
    PersonalProfilewithc(
      Verified: json['Verified'] as int?,
      Createdby: json['Createdby'] == null
          ? null
          : Users.fromJson(json['Createdby'] as Map<String, dynamic>),
      Quality: json['Quality'] as String?,
      id: json['_id'] as String?,
      Name: json['Name'] as String?,
      Sno: json['Sno'] as String?,
      Age: json['Age'] as String?,
      Income: json['Income'] as int?,
      Special: json['Special'] as int?,
      BirthPlace: json['BirthPlace'] as String?,
      BirthTime: json['BirthTime'] as String?,
      ContactInfoobj: json['ContactInfo'] == null
          ? null
          : ContactInfo.fromJson(json['ContactInfo'] as Map<String, dynamic>),
      DateOfBirth: json['DateofBirth'] as String?,
      Designation: json['Designation'] as String?,
      Father: json['Father'] as String?,
      GotraFather: json['GotraFather'] as String?,
      GotraMother: json['GotraMother'] as String?,
      Height: json['Height'] as String?,
      Manglik: json['Manglik'] as String?,
      Listed: json['Listed'] as int?,
      Married: json['Married'] as String?,
      Mother: json['Mother'] as String?,
      NameOfOrganisation: json['NameOfOrganisation'] as String?,
      PhotoLink1: json['PhotoLink1'] as String?,
      PhotoLink2: json['PhotoLink2'] as String?,
      Profession: json['Profession'] as String?,
      Qualification: json['Qualification'] as String?,
      WorkCity: json['WorkCity'] as String?,
      Gender: json['Gender'] as String?,
    );

Map<String, dynamic> _$PersonalProfilewithcToJson(
        PersonalProfilewithc instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'Sno': instance.Sno,
      'Name': instance.Name,
      'Manglik': instance.Manglik,
      'Gender': instance.Gender,
      'Father': instance.Father,
      'Mother': instance.Mother,
      'DateofBirth': instance.DateOfBirth,
      'Age': instance.Age,
      'BirthTime': instance.BirthTime,
      'BirthPlace': instance.BirthPlace,
      'Height': instance.Height,
      'Profession': instance.Profession,
      'Qualification': instance.Qualification,
      'Designation': instance.Designation,
      'NameOfOrganisation': instance.NameOfOrganisation,
      'WorkCity': instance.WorkCity,
      'GotraFather': instance.GotraFather,
      'GotraMother': instance.GotraMother,
      'PhotoLink1': instance.PhotoLink1,
      'PhotoLink2': instance.PhotoLink2,
      'Married': instance.Married,
      'Verified': instance.Verified,
      'Income': instance.Income,
      'Special': instance.Special,
      'Quality': instance.Quality,
      'Createdby': instance.Createdby?.toJson(),
      'ContactInfo': instance.ContactInfoobj?.toJson(),
      'Listed': instance.Listed,
    };
