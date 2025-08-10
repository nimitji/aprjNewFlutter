import 'package:aprjnew/classes/userclass.dart';

import 'package:json_annotation/json_annotation.dart';
part'deleterequest.g.dart';
@JsonSerializable(explicitToJson:true)
class DeleteRequestClass{
  @JsonKey(name:"_id")
  String?id;
  Users?requestby;
  String? deleterequest;



  DeleteRequestClass({
    this.id,this.requestby,this.deleterequest});


  factory DeleteRequestClass.fromJson(Map<String,dynamic>json)=>_$DeleteRequestClassFromJson(json);
  Map<String,dynamic>toJson()=>_$DeleteRequestClassToJson(this);

}