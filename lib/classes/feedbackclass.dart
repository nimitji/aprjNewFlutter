import 'package:aprjnew/classes/userclass.dart';
import 'package:json_annotation/json_annotation.dart';
part'feedbackclass.g.dart';

@JsonSerializable(explicitToJson: true)
class Feedbackbu{
  @JsonKey(name:"_id")
  String? id;
  String? feedback;
  Users? user;


  Feedbackbu(
      {this.id,
        this.feedback,
        this.user}
      );

  factory Feedbackbu.fromjson(Map<String,dynamic>json)=>_$FeedbackbuFromJson(json);


  Map<String,dynamic>toJson()=>_$FeedbackbuToJson(this);



}
