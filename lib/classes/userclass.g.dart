// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['_id'] as String?,
      FCMtoken: json['FCMtoken'] as String?,
      city: json['city'] as String?,
      emailid: json['emailid'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      usertype: json['usertype'] as String?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'emailid': instance.emailid,
      'city': instance.city,
      'password': instance.password,
      'phone': instance.phone,
      'usertype': instance.usertype,
      'FCMtoken': instance.FCMtoken,
    };
