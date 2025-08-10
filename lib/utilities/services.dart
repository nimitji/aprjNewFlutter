import 'dart:convert';

import 'package:aprjnew/classes/APPS.dart';
import 'package:aprjnew/classes/ContactInfo.dart';
import 'package:aprjnew/classes/PersonalProfile.dart';
import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:aprjnew/classes/Updatereqclass.dart';
import 'package:aprjnew/classes/feedbackclass.dart';
import 'package:aprjnew/classes/userclass.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

var url="boreal-gravity-308613.el.r.appspot.com";
String? urlend;
Future <List<Users>> fetchUser(http.Client client)async{
var urls=Uri.https(url,'home/getuser');
  final response=await http.get(urls);
  if(response.statusCode==200){

    return compute(parseusers,response.body);
  }
  else{
    return [];
  }



}

List<Users>parseusers(String responsebody) {
  final parsed=json.decode(responsebody).cast<Map<String,dynamic>>();
  return parsed.map<Users>((json)=>Users.fromJson(json)).toList();

}

Future <List<String>> signupUser(Users users,String fcm)async{
  var urls=Uri.https(url,'home/signup',{"fcm":fcm});

  final response=await http.post(urls,
      headers:<String,String>{
        'Content-Type':'application/json; charset=UTF-8',

      },
      body:jsonEncode(users.toJson())
  );
  if(response.statusCode==200){

    return [response.body,response.statusCode.toString()];
  }
  else{
    print(response.body);
    return [response.body,response.statusCode.toString()];
  }








}

Future <List<PersonalProfile>> getprofiles(http.Client client,String gender,String married,String manglik, int verified,int flag)async{

  var urls;
if(flag==0) {
  urls = Uri.https(url, 'home/getprofile',
      {"Gender": gender, "Married": married, "Manglik": manglik});
}
else{
  urls = Uri.https(url, 'home/getpersonalprofile',
      {"Married": married});
}
print(urls);
  final prefs=await SharedPreferences.getInstance();

  final response=await http.get(urls,
  headers:<String,String>
  {'token':prefs.getString('token').toString()
      },
  );
 // print("fetch profile called");
  //print(response.statusCode);
  if(response.statusCode==200){

    return compute(parseprofile,response.body);
  }
  else{
    return[];
  }


}

Future <List<PersonalProfile>> getquery(String manglikstatus, String gender ) {  // to get the final url based on the activity selected

  String manglik,married;
  int verified,flag;
  if(gender=="F"){
    if(manglikstatus=='M')
    {
      verified=1;
      flag=0;
      gender='F';
      manglik='1';
      married='0';

    }


    else{
      verified=1;
      flag=0;
      gender='F';
      manglik='0';
      married='0';
    }

  }
  else if(gender=="M"){
    if (manglikstatus == 'M')
    {
      verified=1;
      flag=0;
      gender='M';
      manglik='1';
      married='0';
    }

    else{
      verified=1;
      flag=0;
      gender='M';
      manglik='0';
      married='0';
    }

  }
  else{
    verified=1;
    flag=1;
    married='0';
    manglik='0';

  }

  return getprofiles(http.Client(),gender,married,manglik,verified,flag);


}



Future <List<PersonalProfilewithc>> getprofileswithc(http.Client client,String gender,String married,String manglik, int verified,int flag)async{

  var urls;
  if(flag==0) {
    urls = Uri.https(url, 'home/getprofilewithcontact',
        {"Gender": gender, "Married": married, "Manglik": manglik,"Verified":verified.toString()});
  }
  else{
    urls = Uri.https(url, 'home/getverifiedprofiles',
        {"Married": married,"Verified":verified.toString()});
  }

  final prefs=await SharedPreferences.getInstance();

  final response=await http.get(urls,
    headers:<String,String>
    {'token':prefs.getString('token').toString()
    },
  );
  // print("fetch profile called");
  //print(response.statusCode);
  if(response.statusCode==200){

    return compute(parseprofilewithc,response.body);
  }
  else{
    return[];
  }

}




Future <List<PersonalProfilewithc>> getquerywithc(String manglikstatus, String gender ) {  // to get the final url based on the activity selected

   String manglik,married;
   int verified,flag;
if(gender=="F"){
    if(manglikstatus=='M')
      {
        verified=1;
        flag=0;
        gender='F';
        manglik='1';
        married='0';

      }


    else{
      verified=1;
      flag=0;
      gender='F';
      manglik='0';
      married='0';
    }

  }
  else if(gender=="M"){
    if (manglikstatus == 'M')
      {
        verified=1;
        flag=0;
        gender='M';
        manglik='1';
        married='0';
      }

    else{
      verified=1;
      flag=0;
      gender='M';
      manglik='0';
      married='0';
    }

  }
  else{
      verified=1;
      flag=1;
      married='0';
      manglik='0';

   }

  return getprofileswithc(http.Client(),gender,married,manglik,verified,flag);


}


List<PersonalProfilewithc>parseprofilewithc(String responsebody) {
  try {
    final parsed = json.decode(responsebody).cast<Map<String, dynamic>>();
    return parsed.map<PersonalProfilewithc>((json) =>
        PersonalProfilewithc.fromJson(json)).toList();
  }catch (e){

  return[];
  }

}


getmstatus(String manglikstatus) {
  if(manglikstatus=="M"){
    return "1";

  }else{
    return "0";
  }

}
List<PersonalProfile>parseprofile(String responsebody) {
  final parsed=json.decode(responsebody).cast<Map<String,dynamic>>();
  return parsed.map<PersonalProfile>((json)=>PersonalProfile.fromJson(json)).toList();

}

Future<List<String>> fetchlogintoken(Users user,String fcm)async{
  var urls=Uri.https(url,'home/signin',{"fcm":fcm});


  final response=await http.post(urls,
  headers:<String,String>{
    'Content-Type':'application/json; charset=UTF-8',
    },
    body:jsonEncode(user.toJson())
  );
  if(response.statusCode==200){

    return [response.body,response.statusCode.toString()];
    }
  else{
    print(response.body);
    return [response.body,response.statusCode.toString()];
  }

}

Future <List<ContactInfo>> getcontactinfo(http.Client client,String sno,String objid)async{
var urls;

  final prefs=await SharedPreferences.getInstance();
 // print(objid+sno+" getcontact called");
 // String res=getcquery(sno, objid);
  if(objid=="NA"){
   urls=Uri.https(url,'home/getcontactinfobyobj',{"objid":objid});}
  else{
  urls=Uri.https(url,'home/getcontactinfobysno',{"Sno":sno});
  }

  final response=await http.get(urls,
      headers:{'token':prefs.getString('token').toString()});

  //print("fetch profile called");
  //print(response.statusCode);
  if(response.statusCode==200){

    return compute(parsecontact,response.body);
  }

  else{
    return[];
  }

}

String getcquery(String s, String objid) {  // to get the final url based on the activity selected
  if(s=="NA") {
    return 'getcontactinfobyobj?objid=$objid';
  }
    else
      return'getcontactinfobysno?Sno=$s';


}


List<ContactInfo> parsecontact(String responsebody) {
  final parsed=json.decode(responsebody).cast<Map<String,dynamic>>();
  return parsed.map<ContactInfo>((json)=>ContactInfo.fromJson(json)).toList();

}

Future <List<Apps>> fetchapps(http.Client client)async{
  final prefs=await SharedPreferences.getInstance();
  var urls=Uri.https(url,'home/getappsinfo');
  final response=await http.get(urls,
      headers:{'token':prefs.getString('token').toString()});

  if(response.statusCode==200){

    return compute(parseapps,response.body);
  }

  else{
    return[];
  }


}

List<Apps>parseapps(String responsebody) {
  final parsed=json.decode(responsebody).cast<Map<String,dynamic>>();
  return parsed.map<Apps>((json)=>Apps.fromjson(json)).toList();

}

String formattoken(String token){
  final String part=token.split('"')[3];
  return part;
}

Future<String>saveprofile(PersonalProfilewithc newprofile)async{
  final prefs=await SharedPreferences.getInstance();
  var urls=Uri.https(url,'/home/savepersonalprofile');
  final response=await http.post(urls,
      headers:<String,String>{
        'Content-Type':'application/json; charset=UTF-8',
        'token':prefs.getString('token').toString()
      },
      body:jsonEncode(newprofile.toJson())
  );
  if(response.statusCode==200){

    return response.statusCode.toString();
  }
  else{
    print(response.body);
    return response.statusCode.toString();
  }

}

Future<String>savefeedback(Feedbackbu newfeedback)async{
  final prefs=await SharedPreferences.getInstance();
  var urls=Uri.https(url,'/home/savefeedback');
  final response=await http.post(urls,
      headers:<String,String>{
        'Content-Type':'application/json; charset=UTF-8',
        'token':prefs.getString('token').toString()
      },
      body:jsonEncode(newfeedback.toJson())
  );
  if(response.statusCode==200){

    return response.statusCode.toString();
  }
  else{
    print(response.body);
    return response.statusCode.toString();
  }

}

Future <String> getnamewithsno(String sno)async{
  final prefs=await SharedPreferences.getInstance();
  var urls=Uri.https(url,'home/getprofilewithsno',{'Sno':sno});
  final response=await http.get(urls,
      headers:{'token':prefs.getString('token').toString()});

  if(response.statusCode==200){

    return response.body;
  }
  else{
    return "";
  }



}


Future<List<PersonalProfilewithc>> getprofilewithsno(String sno)async{
  final prefs=await SharedPreferences.getInstance();
  var urls=Uri.https(url,'home/getprofilewithsno',{'Sno':sno});
  final response=await http.get(urls,
      headers:{'token':prefs.getString('token').toString()});

  if(response.statusCode==200){
    print(response.body);

    return compute(parseprofilewithc,response.body);
  }
  else{
    return [];
  }



}

Future<String>saveupdatereq(Updatereq newreq)async{
  final prefs=await SharedPreferences.getInstance();
  var urls=Uri.https(url,'/home/saveupdatereq');
  final response=await http.post(urls,
      headers:<String,String>{
        'Content-Type':'application/json; charset=UTF-8',
        'token':prefs.getString('token').toString()
      },
      body:jsonEncode(newreq.toJson())
  );
  if(response.statusCode==200){

    return response.statusCode.toString();
  }
  else{
    print(response.body);
    return response.statusCode.toString();
  }

}

void subscribetotopic(String s, FirebaseMessaging fcm) async{

  String s1=s.replaceAll(' ','');
  String s2=s1.replaceAll('/','');
  await fcm.subscribeToTopic(s2);
}
String checkvalidation(String value) {

  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  if(emailValid){
    return value;
  }
  else{
    return "mailerror";
  }


}


Future<int> clearsharedprefs()async{
  final prefs=await SharedPreferences.getInstance();
  await prefs.remove("token");
  await prefs.remove("phone");
  return 1;
}