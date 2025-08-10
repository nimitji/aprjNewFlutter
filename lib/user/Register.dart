import 'package:aprjnew/classes/userclass.dart';
import 'package:aprjnew/home/HomeScreen.dart';
import 'package:aprjnew/utilities/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../Constants/routedart.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _citycontroller = TextEditingController();
  String? fcmtoken="";

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
bool islogin=false;


  @override
  void initState() {

    _fcm.getToken().then((value) => {
      fcmtoken=value.toString()
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: ListView(children: <Widget>[
          Column(
            children: [
              Column
                (
                children: [
                  Padding
                    (
                      padding: EdgeInsets.symmetric(vertical: 20.0
                      )
                  )
                  ,
                  Text
                    ("अविवाहित प्रतिभाए प्रस्तुति समूह",
                    style: TextStyle
                      (
                        fontSize: 22
                        ,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                  ,
                  Text
                    ("प्रस्तुत करते है",
                    style: TextStyle
                      (
                        fontSize: 22
                        ,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                  ,
                  Text
                    ("जैसवाल जैन परिणय",
                    style: TextStyle
                      (
                        fontSize: 30
                        ,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [

                    Text("रजिस्टर",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white))


                  ],
                ),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                  child: Form(
                      child: Column(
                                children: [
                                  SizedBox(height: 10.0),
                                  Text("अपना फ़ोन नंबर डालिये",style: TextStyle(fontSize: 20,color: Colors.white),),
                                  Container(height: 50.0,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child:TextFormField(
                                    style: TextStyle(fontSize: 30,),
                                    controller: _emailcontroller,
                                    keyboardType:TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter Phone';
                                      }
                                      return null;
                                    },
                                  ),
                                      decoration: BoxDecoration(color:Colors.white,
                                          borderRadius:BorderRadius.circular(10.0) ),
                                      ),
                                  SizedBox(height: 20.0),
                                  Text("अपना नाम डालिये",style: TextStyle(fontSize: 20,color: Colors.white),),
                                  Container(height: 50.0,
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child:TextFormField(
                                      style: TextStyle(fontSize: 30,),
                                      controller: _namecontroller,
                                      keyboardType:TextInputType.text,
                                      textCapitalization: TextCapitalization.characters,

                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Phone';
                                        }
                                        return null;
                                      },


                                    ),


                                    decoration: BoxDecoration(color:Colors.white,
                                        borderRadius:BorderRadius.circular(10.0) ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text("अपने शहर का नाम डालिये",style: TextStyle(fontSize: 20,color: Colors.white),),
                                  Container(height: 50.0,
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    child:TextFormField(
                                      style: TextStyle(fontSize: 30,),
                                      controller: _citycontroller,
                                      keyboardType:TextInputType.text,
                                      textCapitalization: TextCapitalization.characters,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter Phone';
                                        }
                                        return null;
                                      },

                                    ),


                                    decoration: BoxDecoration(color:Colors.white,
                                        borderRadius:BorderRadius.circular(10.0) ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Container(height: 20,
                                      child: Text("रजिस्टर करने का मतलब आप हमारे सभी ",
                                        style: TextStyle(color: Colors.white,fontSize: 14),)),
                                  Container(
                                    child:InkWell( child: Text("नियम, शर्ते व प्राइवेसी पालिसी",
                                      style: TextStyle(color: Colors.indigoAccent,fontSize: 14),),
                                      onTap:(){
                                        Get.toNamed(AppRoute.privacypolicy);
                                      },

                                    ),
                                  ),
                                  Container(
                                      child: Text("मानते है ",
                                        style: TextStyle(color: Colors.white,fontSize: 14),)),
                                  SizedBox(height: 20.0),
                                  Container(height: 50,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<
                                                  Color>(Colors.green),
                                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15.0),
                                                    side: BorderSide(color: Colors.green)
                                                ),
                                              ),
                                          ),

                                          child: !islogin?Text(
                                            "रजिस्टर करिये",
                                               style: TextStyle(
                                                color: Colors.white,

                                                fontSize: 20),
                                          ):CircularProgressIndicator(),

                                          onPressed: () async {
                                            setState(() {
                                              islogin=true;
                                            });
                                            Users user=Users(
                                                phone:_emailcontroller.text,
                                                password:_emailcontroller.text,
                                                name:_namecontroller.text,
                                              city: _citycontroller.text,
                                              usertype:"Guest",
                                              emailid: 'NA'


                                            );
                                            List<String> result=await signupUser(user,fcmtoken!);

                                            if(result[1]=="404")
                                              {
                                                getdialog("404","Error","Incomeplete Details");
                                                setState(() {
                                                  islogin=false;
                                                });
                                              }
                                            else if(result[1]=="402"){
                                              getdialog("402","Error","Incorrect password");
                                              islogin=false;
                                            }
                                            else if(result[1]=="401"){
                                              getdialog("401","Error","User not Found");
                                              islogin=false;
                                            }
                                            else if(result[1]=="400"){
                                              getdialog("400","Error","minimum 10 character for Phone");
                                              islogin=false;

                                            }
                                           else{
                                              String token=formattoken(result[0]);
                                              _saveSessionLogin(token,user.phone!);
                                            }



                                          }


                                          /*async{
                                                await fetchUser(http.Client()); },

            */

                                          )),

                                  SizedBox(height: 20.0),

                    ],
                  ))),
            ],
          )
        ]));
  }

  _saveSessionLogin(String token,String phone)async{
    print(token);
    final prefs=await SharedPreferences.getInstance();
    prefs.setString('token',token);
    prefs.setString('phone',phone);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  }
  void getdialog(String s, String t, String u) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(t),
            content: Container(
              height: 60,
              width: 30,
              child: Text(u+" with error code"+s),
            ),
            actions: <Widget>[
              TextButton(
                  child: Text("Exit"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Register()));
                  }),
            ],
            elevation: 24,
          );
        });
  }


}
