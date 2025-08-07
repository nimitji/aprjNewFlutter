import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../classes/PersonalProfilewithcontact.dart';
import '../../classes/deleterequest.dart';
import '../../utilities/Helpers/app_exception.dart';
import '../../utilities/services.dart';
class ProfileServices{

  ProfileServices._();
  static final ProfileServices _instance=ProfileServices._();
  static ProfileServices get instance=> _instance;

  Future<Map<String, dynamic>> getprofiles()async{

    final prefs=await SharedPreferences.getInstance();
    var urls=Uri.https(url,'/home/getallprofiles');
    print(urls);
    final response=await http.get(urls,
      headers:<String,String>
      {'token':prefs.getString('token').toString()
      },
    );

    if (response.statusCode != 200) {
      if (kDebugMode) {
        print("Something went wrong with ${response.statusCode}");
      }
      final map = {
        'code': response.statusCode,
        'data': response.body,
      };
      return map;
    }
    else {
      final responseData=json.decode(response.body).cast<Map<String,dynamic>>();
      print(responseData);
      //final responseData = json.decode(response.body);
      final dataModel = responseData.map<PersonalProfilewithc>((json)=>PersonalProfilewithc.fromJson(json)).toList();
      final map = {
        'code': response.statusCode,
        'data': dataModel,
      };
      return map;

    }


  }

  Future<Map<String, dynamic>> getindividualprofiles(String id)async{
print(id);
    final prefs=await SharedPreferences.getInstance();
    var urls=Uri.https(url,'/home/getindividual',{"id":id});
    final response=await http.get(urls,
      headers:<String,String>
      {'token':prefs.getString('token').toString()
      },
    );

    if (response.statusCode != 200) {
      if (kDebugMode) {
        print("Something went wrong with ${response.statusCode}");
      }
      final map = {
        'code': response.statusCode,
        'data': response.body,
      };
      return map;
    }
    else {
      final responseData=json.decode(response.body);
      print(responseData);
      //final responseData = json.decode(response.body);
      final dataModel = PersonalProfilewithc.fromJson(responseData);
      final map = {
        'code': response.statusCode,
        'data': dataModel,
      };
      return map;

    }


  }

  Future<Map<String, dynamic>> getprofileswithsno({@required sno})async{

    final prefs=await SharedPreferences.getInstance();
    var urls=Uri.https(url,'/home/getcompleteprofilewithsno',{"Sno":sno});
    print(urls);
    final response=await http.get(urls,
      headers:<String,String>
      {'token':prefs.getString('token').toString()
      },
    );

    if (response.statusCode != 200) {
      if (kDebugMode) {
        print("Something went wrong with ${response.statusCode}");
      }
      final map = {
        'code': response.statusCode,
        'data': response.body,
      };
      return map;
    }
    else {
      final responseData=json.decode(response.body);
      print(responseData);
      //final responseData = json.decode(response.body);
      final dataModel = PersonalProfilewithc.fromJson(responseData);
      final map = {
        'code': response.statusCode,
        'data': dataModel,
      };
      return map;

    }


  }

  Future<Map<String,dynamic>>deleterequest(DeleteRequestClass newuser)async{
    final prefs = await SharedPreferences.getInstance();
    var urls=Uri.https(url,'/home/newdeleterequest');
    try {
      final response = await http.post(urls,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'token': prefs.getString('token').toString()
          },
          body:jsonEncode(newuser.toJson())

      );
      if (response.statusCode != 200) {
        if (kDebugMode) {
          print("Something went wrong with ${response.statusCode}");
        }
        final map = {
          'code': response.statusCode,
          'data': response.body,
        };
        return map;
      }
      else {
        //final responseData=json.decode(response.body);
        final map = {
          'code': response.statusCode,
          'data': response.body,
        };
        return map;

      }




    } on SocketException {
      throw FetchDataException('No Internet connection', urls.toString());
    } on Exception catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }

  }



}