// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Updatereqclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Updatereq _$UpdatereqFromJson(Map<String, dynamic> json) => Updatereq(
      id: json['_id'] as String?,
      RequestDetails: json['RequestDetails'] as String?,
      profileID: json['profileID'] == null
          ? null
          : PersonalProfilewithc.fromJson(
              json['profileID'] as Map<String, dynamic>),
      Processed: json['Processed'] as int?,
    );

Map<String, dynamic> _$UpdatereqToJson(Updatereq instance) => <String, dynamic>{
      '_id': instance.id,
      'RequestDetails': instance.RequestDetails,
      'profileID': instance.profileID?.toJson(),
      'Processed': instance.Processed,
    };
