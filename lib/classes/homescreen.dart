import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:aprjnew/classes/banner.dart';
import 'package:aprjnew/classes/userclass.dart';
import 'package:json_annotation/json_annotation.dart';
part'homescreen.g.dart';
@JsonSerializable(explicitToJson: true)
class HomeScreenModel{
  List<PersonalProfilewithc>? MyAddedProfile;
  List<PersonalProfilewithc>? Special;
  List<BannerClass>? AdBanners;
  List<BannerClass>? SecondBanner;
  List<BannerClass>? MainBanner;

  HomeScreenModel(
      {this.AdBanners,this.MainBanner,this.MyAddedProfile,this.SecondBanner,this.Special});
  factory HomeScreenModel.fromjson(Map<String,dynamic>json)=>_$HomeScreenModelFromJson(json);


  Map<String,dynamic>toJson()=>_$HomeScreenModelToJson(this);




}

