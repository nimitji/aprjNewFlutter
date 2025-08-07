import 'package:json_annotation/json_annotation.dart';
part'APPS.g.dart';
@JsonSerializable(explicitToJson: true)
class Apps{
  @JsonKey(name:"_id")
  String? id;
  String? Name;
  String? Phone;
  String? City;
  String? Photolink;
  Apps(
  {this.id,this.City,this.Name,this.Phone,this.Photolink});
  factory Apps.fromjson(Map<String,dynamic>json)=>_$AppsFromJson(json);


  Map<String,dynamic>toJson()=>_$AppsToJson(this);




}

