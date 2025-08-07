// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'APPS.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apps _$AppsFromJson(Map<String, dynamic> json) => Apps(
      id: json['_id'] as String?,
      City: json['City'] as String?,
      Name: json['Name'] as String?,
      Phone: json['Phone'] as String?,
      Photolink: json['Photolink'] as String?,
    );

Map<String, dynamic> _$AppsToJson(Apps instance) => <String, dynamic>{
      '_id': instance.id,
      'Name': instance.Name,
      'Phone': instance.Phone,
      'City': instance.City,
      'Photolink': instance.Photolink,
    };
