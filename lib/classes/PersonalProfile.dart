import 'package:aprjnew/classes/userclass.dart';
import 'package:json_annotation/json_annotation.dart';

part'PersonalProfile.g.dart';
@JsonSerializable(explicitToJson: true)
class PersonalProfile{
  @JsonKey(name:"_id")
  String? id;
  String? Sno;
  String? Name;
  String? Manglik;
  String? Gender;
  String? Father;
  String? Mother;
  @JsonKey(name:"DateofBirth")
  String? DateOfBirth;
  String? Age;
  String? BirthTime;
  String? BirthPlace;
  String? Height;
  String? Profession;
  String? Qualification;
  String? Designation;
  String? NameOfOrganisation;
  String? WorkCity;
  String? GotraFather;
  String? GotraMother;
  String? PhotoLink1;
  String? PhotoLink2;
  String? Married;
  String? ContactInfo;
  String? PresentAddress;
  String? PermanentAddress;
  String? Hobbies;
  String? AboutMe;
  String? Income;
  int? Special;
  Users? Createdby;
PersonalProfile(
  {this.Createdby,
    this.id,this.Income,this.Special,this.Name,this.Sno,this.AboutMe,this.Age,
    this.BirthPlace,this.BirthTime,this.ContactInfo,this.DateOfBirth,this.Designation,
    this.Father,this.GotraFather,this.GotraMother,this.Height,this.Hobbies,this.Manglik,
    this.Married,this.Mother,this.NameOfOrganisation,this.PermanentAddress,this.PresentAddress,
    this.PhotoLink1,this.PhotoLink2,this.Profession,this.Qualification,this.WorkCity,this.Gender
  });
  factory PersonalProfile.fromJson(Map<String,dynamic>json)=>_$PersonalProfileFromJson(json);


  Map<String,dynamic>toJson()=>_$PersonalProfileToJson(this);




}

