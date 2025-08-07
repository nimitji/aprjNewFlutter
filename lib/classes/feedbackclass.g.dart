// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedbackclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedbackbu _$FeedbackbuFromJson(Map<String, dynamic> json) => Feedbackbu(
      id: json['_id'] as String?,
      feedback: json['feedback'] as String?,
      user: json['user'] == null
          ? null
          : Users.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackbuToJson(Feedbackbu instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'feedback': instance.feedback,
      'user': instance.user?.toJson(),
    };
