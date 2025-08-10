// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleterequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRequestClass _$DeleteRequestClassFromJson(Map<String, dynamic> json) =>
    DeleteRequestClass(
      id: json['_id'] as String?,
      requestby: json['requestby'] == null
          ? null
          : Users.fromJson(json['requestby'] as Map<String, dynamic>),
      deleterequest: json['deleterequest'] as String?,
    );

Map<String, dynamic> _$DeleteRequestClassToJson(DeleteRequestClass instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'requestby': instance.requestby?.toJson(),
      'deleterequest': instance.deleterequest,
    };
