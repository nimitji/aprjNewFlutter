import 'package:json_annotation/json_annotation.dart';
part'ContactInfo.g.dart';
@JsonSerializable(explicitToJson: true)
class ContactInfo{
  @JsonKey(name:"_id")
  String? id;
  String? Sno;
  String? MobileNumber1;
  String? MobileNumber2;
  String? HouseNumber;
  String? Street;
  String? City;
  String? VillageLocality;
  String? State;
  String? Country;
  String? Pincode;
  String? NameOfCP;
  String? profileID;
  ContactInfo(
  {this.Sno,this.City,this.Country,this.HouseNumber,this.id
  ,this.MobileNumber1,this.MobileNumber2,this.NameOfCP,this.Pincode,this.profileID,
  this.State,this.Street,this.VillageLocality});
  factory ContactInfo.fromJson(Map<String,dynamic>json)=>_$ContactInfoFromJson(json);


  Map<String,dynamic>toJson()=>_$ContactInfoToJson(this);




}

