// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ContactInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
      Sno: json['Sno'] as String?,
      City: json['City'] as String?,
      Country: json['Country'] as String?,
      HouseNumber: json['HouseNumber'] as String?,
      id: json['_id'] as String?,
      MobileNumber1: json['MobileNumber1'] as String?,
      MobileNumber2: json['MobileNumber2'] as String?,
      NameOfCP: json['NameOfCP'] as String?,
      Pincode: json['Pincode'] as String?,
      profileID: json['profileID'] as String?,
      State: json['State'] as String?,
      Street: json['Street'] as String?,
      VillageLocality: json['VillageLocality'] as String?,
    );

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'Sno': instance.Sno,
      'MobileNumber1': instance.MobileNumber1,
      'MobileNumber2': instance.MobileNumber2,
      'HouseNumber': instance.HouseNumber,
      'Street': instance.Street,
      'City': instance.City,
      'VillageLocality': instance.VillageLocality,
      'State': instance.State,
      'Country': instance.Country,
      'Pincode': instance.Pincode,
      'NameOfCP': instance.NameOfCP,
      'profileID': instance.profileID,
    };
