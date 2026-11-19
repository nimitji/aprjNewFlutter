import 'package:aprjnew/classes/userclass.dart';
import 'package:json_annotation/json_annotation.dart';
part'banner.g.dart';
@JsonSerializable(explicitToJson: true)
class BannerClass{
  @JsonKey(name:"_id")
  String? id;
  String? Title;
  String? SubTitle;
  String? Discount;
  List<String>? ImageUrl;
  String? BannerType;
  Users? UploadedBy;
  int? Active;
  BannerClass(
      {this.id,this.Active,this.BannerType,this.Discount,this.ImageUrl,this.SubTitle,this.Title,this.UploadedBy});
  factory BannerClass.fromJson(Map<String,dynamic>json)=>_$BannerClassFromJson(json);


  Map<String,dynamic>toJson()=>_$BannerClassToJson(this);




}

