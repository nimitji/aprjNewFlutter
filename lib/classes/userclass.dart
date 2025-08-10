import 'package:json_annotation/json_annotation.dart';
part'userclass.g.dart';

@JsonSerializable(explicitToJson: true)
class Users{
@JsonKey(name:"_id")
  String? id;
  String? name;
  String? emailid;
  String? city;
  String? password;
  String? phone;
  String? usertype;
  String? FCMtoken;

  Users(
      {this.id,this.FCMtoken,
        this.city,
        this.emailid,
        this.name,
        this.password,
        this.phone,
        this.usertype}
        );

  factory Users.fromJson(Map<String,dynamic>json)=>_$UsersFromJson(json);


  Map<String,dynamic>toJson()=>_$UsersToJson(this);



}
