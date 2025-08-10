import 'package:aprjnew/classes/userclass.dart';
import 'package:json_annotation/json_annotation.dart';
import 'ContactInfo.dart';

part'PersonalProfilewithcontact.g.dart';
@JsonSerializable(explicitToJson: true)
class PersonalProfilewithc{
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
  int? Verified;
  int? Income;
  int? Special;
  String?Quality;
  Users? Createdby;
  @JsonKey(name:"ContactInfo")
  ContactInfo? ContactInfoobj;
  int?Listed;

PersonalProfilewithc(
  {this.Verified,this.Createdby,this.Quality,
    this.id,this.Name,this.Sno,this.Age,this.Income,this.Special,
    this.BirthPlace,this.BirthTime,this.ContactInfoobj,this.DateOfBirth,this.Designation,
    this.Father,this.GotraFather,this.GotraMother,this.Height,this.Manglik,this.Listed,
    this.Married,this.Mother,this.NameOfOrganisation,this.PhotoLink1,this.PhotoLink2,this.Profession,this.Qualification,this.WorkCity,this.Gender
  });
  factory PersonalProfilewithc.fromJson(Map<String,dynamic>json)=>_$PersonalProfilewithcFromJson(json);


  Map<String,dynamic>toJson()=>_$PersonalProfilewithcToJson(this);






}

