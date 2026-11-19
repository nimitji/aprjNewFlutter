// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homescreen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenModel _$HomeScreenModelFromJson(
  Map<String, dynamic> json,
) => HomeScreenModel(
  AdBanners:
      (json['AdBanners'] as List<dynamic>?)
          ?.map((e) => BannerClass.fromJson(e as Map<String, dynamic>))
          .toList(),
  MainBanner:
      (json['MainBanner'] as List<dynamic>?)
          ?.map((e) => BannerClass.fromJson(e as Map<String, dynamic>))
          .toList(),
  MyAddedProfile:
      (json['MyAddedProfile'] as List<dynamic>?)
          ?.map((e) => PersonalProfilewithc.fromJson(e as Map<String, dynamic>))
          .toList(),
  SecondBanner:
      (json['SecondBanner'] as List<dynamic>?)
          ?.map((e) => BannerClass.fromJson(e as Map<String, dynamic>))
          .toList(),
  Special:
      (json['Special'] as List<dynamic>?)
          ?.map((e) => PersonalProfilewithc.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$HomeScreenModelToJson(
  HomeScreenModel instance,
) => <String, dynamic>{
  'MyAddedProfile': instance.MyAddedProfile?.map((e) => e.toJson()).toList(),
  'Special': instance.Special?.map((e) => e.toJson()).toList(),
  'AdBanners': instance.AdBanners?.map((e) => e.toJson()).toList(),
  'SecondBanner': instance.SecondBanner?.map((e) => e.toJson()).toList(),
  'MainBanner': instance.MainBanner?.map((e) => e.toJson()).toList(),
};
