// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PersonalProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalProfile _$PersonalProfileFromJson(Map<String, dynamic> json) =>
    PersonalProfile(
      Createdby: json['Createdby'] == null
          ? null
          : Users.fromJson(json['Createdby'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      Income: json['Income'] as String?,
      Special: json['Special'] as int?,
      Name: json['Name'] as String?,
      Sno: json['Sno'] as String?,
      AboutMe: json['AboutMe'] as String?,
      Age: json['Age'] as String?,
      BirthPlace: json['BirthPlace'] as String?,
      BirthTime: json['BirthTime'] as String?,
      ContactInfo: json['ContactInfo'] as String?,
      DateOfBirth: json['DateofBirth'] as String?,
      Designation: json['Designation'] as String?,
      Father: json['Father'] as String?,
      GotraFather: json['GotraFather'] as String?,
      GotraMother: json['GotraMother'] as String?,
      Height: json['Height'] as String?,
      Hobbies: json['Hobbies'] as String?,
      Manglik: json['Manglik'] as String?,
      Married: json['Married'] as String?,
      Mother: json['Mother'] as String?,
      NameOfOrganisation: json['NameOfOrganisation'] as String?,
      PermanentAddress: json['PermanentAddress'] as String?,
      PresentAddress: json['PresentAddress'] as String?,
      PhotoLink1: json['PhotoLink1'] as String?,
      PhotoLink2: json['PhotoLink2'] as String?,
      Profession: json['Profession'] as String?,
      Qualification: json['Qualification'] as String?,
      WorkCity: json['WorkCity'] as String?,
      Gender: json['Gender'] as String?,
    );

Map<String, dynamic> _$PersonalProfileToJson(PersonalProfile instance) =>
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
      'ContactInfo': instance.ContactInfo,
      'PresentAddress': instance.PresentAddress,
      'PermanentAddress': instance.PermanentAddress,
      'Hobbies': instance.Hobbies,
      'AboutMe': instance.AboutMe,
      'Income': instance.Income,
      'Special': instance.Special,
      'Createdby': instance.Createdby?.toJson(),
    };
