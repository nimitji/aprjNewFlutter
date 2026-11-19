// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerClass _$BannerClassFromJson(Map<String, dynamic> json) => BannerClass(
  id: json['_id'] as String?,
  Active: (json['Active'] as num?)?.toInt(),
  BannerType: json['BannerType'] as String?,
  Discount: json['Discount'] as String?,
  ImageUrl:
      (json['ImageUrl'] as List<dynamic>?)?.map((e) => e as String).toList(),
  SubTitle: json['SubTitle'] as String?,
  Title: json['Title'] as String?,
  UploadedBy:
      json['UploadedBy'] == null
          ? null
          : Users.fromJson(json['UploadedBy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BannerClassToJson(BannerClass instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'Title': instance.Title,
      'SubTitle': instance.SubTitle,
      'Discount': instance.Discount,
      'ImageUrl': instance.ImageUrl,
      'BannerType': instance.BannerType,
      'UploadedBy': instance.UploadedBy?.toJson(),
      'Active': instance.Active,
    };
