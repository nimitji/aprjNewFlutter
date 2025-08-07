import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:json_annotation/json_annotation.dart';
part'Updatereqclass.g.dart';

@JsonSerializable(explicitToJson: true)
class Updatereq{
  @JsonKey(name:"_id")
  String? id;
  String? RequestDetails;
  PersonalProfilewithc? profileID;
  int? Processed;


  Updatereq(
      {this.id,
        this.RequestDetails,
        this.profileID,this.Processed}
      );

  factory Updatereq.fromjson(Map<String,dynamic>json)=>_$UpdatereqFromJson(json);


  Map<String,dynamic>toJson()=>_$UpdatereqToJson(this);



}
