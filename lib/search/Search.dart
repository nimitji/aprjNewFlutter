import 'package:aprjnew/classes/PersonalProfile.dart';
import 'package:aprjnew/classes/PersonalProfilewithcontact.dart';
import 'package:aprjnew/profiles/IndividualProfile.dart';
import 'package:aprjnew/search/Profileswithoutslvr.dart';
import 'package:aprjnew/utilities/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../Constants/routedart.dart';
import '../GlobalUtilities/Controllers/profileController.dart';


class Search extends StatefulWidget{
 String mstatus="hello";
  final List<PersonalProfilewithc>profiles;
  Search(this.profiles);
  @override
  _searchState createState()=>_searchState();

}

class _searchState extends State<Search>{
  final TextEditingController _Name = TextEditingController();
  final TextEditingController _FName = TextEditingController();
  int flag=0;
  String? fromage="NA";
  String? toage="NA";
  bool selected=true;
  String selfgotraddvalue="NA";
  String? qualification="NA";
  String? profession="NA";
  List<PersonalProfilewithc>profiles=[];
  List<PersonalProfilewithc>fileredprofiles=[];
  List<PersonalProfilewithc>afterfileredprofiles=[];


  @override
  void initState() {
    flag=0;
    afterfileredprofiles=[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
       ListView(
          children: [

            SizedBox(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),),
                  Column(
                    children: [
                      Text
                        ("फ़िल्टर लगाए",
                        style: TextStyle
                          (
                            fontSize: 22
                            ,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                              child:Text("नाम",style: TextStyle(fontSize: 30,color: Colors.white),)
                          )
                      ),
                      SizedBox(

                          child:Container(width:250,
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                              child:TextField(controller: _Name,
                                style: TextStyle(fontSize: 20,color: Colors.purple),
                                onChanged: (value){
                                  setState(() {
                                    print(flag);
                                    if(flag==0) {
                                      fileredprofiles =
                                          profiles.where((profiles) =>
                                              profiles.Name!.startsWith(
                                                  value)

                                          ).toList();
                                      selected = false;
                                    }
                                    else{
                                      fileredprofiles =
                                          afterfileredprofiles.where((profiles) =>
                                              profiles.Name!.startsWith(
                                                  value)

                                          ).toList();
                                      selected = false;
                                    }

                                  });

                                },

                              ),
                              decoration: BoxDecoration(color:Colors.white,
                                  borderRadius:BorderRadius.circular(10.0))
                          )
                      ),
                      SizedBox(height:20),
                      SizedBox(
                          child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                              child:Text("पिताजी",style: TextStyle(fontSize: 30,color: Colors.white),)
                          )
                      ),
                      SizedBox(

                          child:Container(width: 250,
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                              child:TextField(controller: _FName,
                                style: TextStyle(fontSize: 20,color: Colors.purple),
                                onChanged: (value){
                                  setState(() {
                                    fileredprofiles = profiles.where((profiles) =>
                                        profiles.Father!.startsWith(
                                            value)

                                    ).toList();
                                    //print(fileredprofiles[0]);
                                    selected=false;

                                  });
                                },

                              ),
                              decoration: BoxDecoration(color:Colors.white,
                                  borderRadius:BorderRadius.circular(10.0))
                          )
                      ),

                    ],
                  ),
                  SizedBox(height:10),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                              child:Text("शिक्षा",style: TextStyle(fontSize: 30,color: Colors.white),)
                          )
                      ),
                      SizedBox(height:10),
                      Container(width: 250,
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        decoration: BoxDecoration(color:Colors.white,
                            borderRadius:BorderRadius.circular(10.0) ),

                        child:DropdownButton<String>(
                          value:qualification,

                          hint: Text("",style: TextStyle(fontSize: 25),),
                          // icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 20,
                          onChanged: (String? newValue){
                            setState(() {
                              if(flag==0) {
                                qualification = newValue;
                                fileredprofiles = profiles.where((profiles) =>
                                    profiles.Qualification!.startsWith(newValue!)

                                ).toList();
                                selected = false;
                                flag=1;
                              }
                              else{
                                qualification = newValue;
                                fileredprofiles = afterfileredprofiles.where((profiles) =>
                                    profiles.Qualification!.startsWith(newValue!)

                                ).toList();
                                selected = false;
                              }
                            });


                          },
                          items:<String>[
                            "NA",
                            "M.A",
                            "Intermediate",
                            "MBA",
                            "B.Tech",
                            "B.COM",
                            "M.COM",
                            "B.E",
                            "HIGHER SEC",
                            "B.A",
                            "MBBS",
                            "B.SC",
                            "MIDDILE",
                            "BCA",
                            "BBA",
                            "MCA",
                            "GRADUATION",
                            "POST GRADUATION",
                            "CA",
                            "LLB",
                            "DIPLOMA",
                            "M.TECH",
                            "BAMS",
                            "M.PHARMA",
                            "B.PHARMA"


                          ]
                              .map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value:value,
                              child:Text(value),
                            );
                          }).toList(),
                        ),)
                    ],
                  ),
                  SizedBox(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),),
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                child:Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                                    child:Text("व्यवसाय",style: TextStyle(fontSize: 30,color: Colors.white),)
                                )
                            ),

                            SizedBox(height:10),
                            Container(width: 250,
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                              decoration: BoxDecoration(color:Colors.white,
                                  borderRadius:BorderRadius.circular(10.0) ),

                              child:DropdownButton<String>(
                                value:profession,

                                hint: Text("Profession",style: TextStyle(fontSize: 25),),
                                // icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 20,
                                onChanged: (String? newValue){
                                  setState(() {
                                    if(flag==0){
                                      profession=newValue;
                                      fileredprofiles = profiles.where((profiles) =>
                                          profiles.Profession!.startsWith(newValue!)
                                      ).toList();
                                      selected=false;
                                      flag=1;
                                    }
                                    else{
                                      profession=newValue;
                                      fileredprofiles = afterfileredprofiles.where((profiles) =>
                                          profiles.Profession!.startsWith(newValue!)
                                      ).toList();
                                      selected=false;
                                    }

                                    //print(fileredprofiles[0]);

                                  });
                                },
                                items:<String>[
                                  "NA",
                                  "BUSINESS",
                                  "SOFTWARE ENGINNER",
                                  "SUPERVISOR",
                                  "CONSULTANT",
                                  "ASSISTANT MANAGER",
                                  "CONTRACTOR",
                                  "BANK MANAGER",
                                  "INCHARGE",
                                  "TEACHER",
                                  "DISTRIBUTOR",
                                  "MANAGER",
                                  "ENTREPRENEUR",
                                  "ACCOUNTANT",
                                  "ACCOUNT OFFICER",
                                  "HEAD",
                                  "TEAM LEADER",
                                  "AGENT",
                                  "DEALER",
                                  "INTERN",
                                  "PROFESSOR",
                                  "ENGINEER",
                                  "DESIGNER",
                                  "OPERATOR",
                                  "BROKER",
                                  "LEUTINENT",
                                  "ADVOCATE",
                                  "ANALYST",
                                  "PLANNER",
                                  "DEVELOPER",
                                  "OBSERVER",
                                  "OFFICER",
                                  "SCIENTIST",
                                  "STENO",
                                  "SURVEYOR",
                                  "DIRECTOR"


                                ]
                                    .map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value:value,
                                    child:Text(value),
                                  );
                                }).toList(),
                              ),)
                          ],
                        ),
                        SizedBox(height: 10,),







                      ],
                    ),

                  ),
                  SizedBox(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),),
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                child:Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                                    child:Text("आयु",style: TextStyle(fontSize: 30,color: Colors.white),)
                                )
                            ),

                            SizedBox(height:10),
                            Container(width: 250,
                                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: BoxDecoration(color:Colors.white,
                                    borderRadius:BorderRadius.circular(10.0) ),

                                child:Row(
                                  children: [
                                    DropdownButton<String>(
                                      value:fromage,

                                      hint: Text("Age",style: TextStyle(fontSize: 25),),
                                      // icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 20,
                                      onChanged: (newValue){
                                        setState(() {
                                          if(flag==0){
                                            fromage=newValue;
                                            fileredprofiles = profiles.where((profiles) =>
                                                profiles.Age!.contains(fromage!)
                                            ).toList();
                                            selected=false;
                                            flag=1;
                                          }
                                          else{
                                            fromage=newValue;
                                            fileredprofiles = afterfileredprofiles.where((profiles) =>
                                                profiles.Profession!.startsWith(newValue!)
                                            ).toList();
                                            selected=false;
                                          }

                                          //print(fileredprofiles[0]);

                                        });
                                      },
                                      items:<String>[
                                        'NA','18','19','20','21','22','23','24','25','26',
                                        '27','28','29','30','31','32','33','34','35','36',
                                        '37','38','39','40','41','42','43','44','45','46','47','48','49','50'


                                      ]
                                          .map<DropdownMenuItem<String>>((String value){
                                        return DropdownMenuItem<String>(
                                          value:value,
                                          child:Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(width: 40,
                                        child:Text("से",style: TextStyle(fontSize: 20),)),
                                    DropdownButton<String>(
                                      value:toage,

                                      hint: Text("Age",style: TextStyle(fontSize: 25),),
                                      // icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 20,
                                      onChanged: (String? newValue){
                                        setState(() {
                                          if(flag==0){
                                            toage=newValue;
                                            fileredprofiles = profiles.where((profiles) =>
                                                profiles.Profession!.startsWith(newValue!)
                                            ).toList();
                                            selected=false;
                                            flag=1;
                                          }
                                          else{
                                            toage=newValue;
                                            fileredprofiles = afterfileredprofiles.where((profiles) =>
                                                profiles.Profession!.startsWith(newValue!)
                                            ).toList();
                                            selected=false;
                                          }

                                          //print(fileredprofiles[0]);

                                        });
                                      },
                                      items:<String>[
                                        'NA','18','19','20','21','22','23','24','25','26',
                                        '27','28','29','30','31','32','33','34','35','36',
                                        '37','38','39','40','41','42','43','44','45','46',
                                        '47','48','49','50'


                                      ]
                                          .map<DropdownMenuItem<String>>((String value){
                                        return DropdownMenuItem<String>(
                                          value:value,
                                          child:Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(width: 40,
                                        child:Text("तक",style: TextStyle(fontSize: 20),)),

                                  ],
                                ))
                          ],
                        ),
                        SizedBox(height: 10,),







                      ],
                    ),

                  ),
                  SizedBox(height: 10,),
                  Column(
                    children: [
                      Text
                        ("फ़िल्टर बदलने से पहले क्लियर अवश्य करे  ",
                        style: TextStyle
                          (
                            fontSize: 22
                            ,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(height: 50,width: 200,
                        child:  ElevatedButton(onPressed:(){
                          setState(() {
                            selected=true;
                            profession="NA";
                            qualification="NA";
                            _Name.text="";
                            _FName.text="";
                            flag=0;
                            afterfileredprofiles=[];

                          });

                        } , child: Text("क्लियर",style: TextStyle(fontSize: 20),)
                            ,style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(Colors.red),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              ),

                            )),),
                      SizedBox(height: 50,width: 200,
                        child:  ElevatedButton(onPressed:(){
                          if(flag==0) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    FilteredProfiles(
                                        profiles, widget.mstatus)));
                          }else{
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    FilteredProfiles(
                                        afterfileredprofiles, widget.mstatus)));
                          }

                        } , child: Text("प्रोफाइल देखे",style: TextStyle(fontSize: 20),)
                            ,style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<
                                  Color>(Colors.green),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.green)
                                  )
                              ),

                            )),)
                    ],
                  ),




                ],
              ),

            ),









          ],





    );

  }


}



/*class Search extends StatefulWidget{
  final String mstatus,gender,titie;

  Search(this.mstatus, this.gender, this.titie);
  @override
  _searchState createState()=>_searchState();

}

class _searchState extends State<Search>{
bool selected=true;
String selfgotraddvalue="NA";
List<PersonalProfilewithc>profiles=[];
List<PersonalProfilewithc>fileredprofiles=[];

void _filtername(value){
 if(selfgotraddvalue=="NA"){
  setState(() {
    fileredprofiles=profiles;
  });

 }
 else {
   setState(() {
     fileredprofiles = profiles.where((profiles) =>
         profiles.GotraFather.toLowerCase().contains(
             value.toLowerCase())

     ).toList();
     //print(fileredprofiles[0]);

   });
 }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purple,

        body:ListView(
          children: [
            SizedBox(height: 30,),
            Column(
              children: [
                Text
                  ("अविवाहित प्रतिभाए प्रस्तुति समूह",
                  style: TextStyle
                    (
                      fontSize: 22
                      ,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0),),
                  selected?FutureBuilder(
                      future: getquerywithc(widget.mstatus, widget.gender),
                      builder: (context, snapshot) {
                        if (snapshot.hasError)
                          print(snapshot.error);
                        return snapshot.hasData
                            ? _setState(snapshot.data)
                            : Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),);
                      }

                  ):Text(""),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        SizedBox(
                                child:Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                                    child:Text("स्वयं का गोत्र सेलेक्ट कीजिये",style: TextStyle(fontSize: 30,color: Colors.white),)
                                )
                            ),

                      SizedBox(height:50),
                      Container(width: 200,
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                              decoration: BoxDecoration(color:Colors.white,
                                  borderRadius:BorderRadius.circular(10.0) ),

                              child:DropdownButton<String>(
                                value:selfgotraddvalue,

                                hint: Text("स्वयं का गोत्र",style: TextStyle(fontSize: 25),),
                               // icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 20,
                                onChanged: (String newValue){
                                  setState(() {
                                    selfgotraddvalue=newValue;
                                    _filtername(getgotraninenglish(newValue));
                                    selected=true;
                                  });
                                },
                                items:<String>[
                                  "NA",
                                  "अगरैया",
                                  "उचाड़िया",
                                  "उन्नेरिया",
                                  "कठेरिया",
                                  "कोटिया",
                                  "कपरिया",
                                  "कोलानायक",
                                  "कुहेले",
                                  "गढ़ा के शाह",
                                  "गन्धी",
                                  "घीया",
                                  "चड़ोसिया",
                                  "चिकनिया",
                                  "चौरिया",
                                  "जागड़ा",
                                  "झारी के पाण्डिया",
                                  "ठकुरिया",
                                  "ढिलवारी",
                                  "दनगसिया",
                                  "धांगा",
                                  "नायक",
                                  "नाहरमूढा",
                                  "पचगइयां",
                                  "पचमेहरिया",
                                  "पाण्डिया",
                                  "पुनविया",
                                  "पुरिया",
                                  "पूणारावत",
                                  "बघोरिया",
                                  "बजाज",
                                  "बरैठा",
                                  "भण्डारी",
                                  "मिड़ाखुरिया",
                                  "मूंजी",
                                  "मेंहतिया",
                                  "महोरिया",
                                  "रनपुरिया",
                                  "रावत",
                                  "लखेश्वरी",
                                  "लोहरिया",
                                  "साहबजाज",
                                  "सुथनिया",
                                  "संडा",
                                  "साहुला"

                                ]
                                    .map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value:value,
                                    child:Text(value),
                                  );
                                }).toList(),
                              ),)
                    ],
                  ),
                  SizedBox(height: 70,),
                  selected?SizedBox(height: 50,width: 200,
                  child:  ElevatedButton(onPressed:(){

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search1(fileredprofiles,widget.mstatus,widget.gender,getgotraninenglish(selfgotraddvalue),widget.titie)));
                  } , child: Text("अगला फ़िल्टर जोड़े ",style: TextStyle(fontSize: 20),)
                      ,style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<
                            Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.red)
                            )
                        ),

                      )),)
                      :Text("गोत्र सेलेक्ट कीजिये "),
                  SizedBox(height: 20,),

                  selected?SizedBox(height: 50,width: 200,
                    child:  ElevatedButton(onPressed:(){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FilteredProfiles(fileredprofiles,widget.mstatus)));
                    } , child: Text("प्रोफाइल देखे",style: TextStyle(fontSize: 20),)
                        ,style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.green)
                              )
                          ),

                        )),)
                      :Text("गोत्र सेलेक्ट कीजिये ")



                ],
              ),

            ),





          ],
        )




    );

  }

_setState(data) {
  profiles=data;
  return (Text(widget.titie+" \nमें कुल प्रोफाइल जिनका स्वयं का गोत्र\n"+selfgotraddvalue+ " है : "+fileredprofiles.length.toString(),style: TextStyle(color: Colors.white,fontSize: 25),));
}

}*/


getgotraninenglish(String? dropdownvalue1) {
  switch(dropdownvalue1)
  {

    case "अगरैया":
      return "AGRAIYA";
         

    case "उचाड़िया":
      return "UCHARIYA";
         

    case "उन्नेरिया":
      return "UNNERIYA";
         

    case "कठेरिया":
      return "KATHERIYA";
         
    case "कपरिया":
      return "KAPRIYA";
         

    case "कोटिया":
      return "KOTIYA";
         

    case "कोलानायक":
      return "KOLANAYAK";
         

    case "कुहेले":
      return "KUHELE";
         

    case "गढ़ा के शाह":
      return "GADA KE SHAH";
         

    case "गन्धी":
      return "GANDHI";
         
    case "घीया":
      return "GHIYA";
         
    case "चड़ोसिया":
      return "CHADOSIYA";
         
    case "चिकनिया":
      return "CHIKANIYA";
         
    case "चौरिया":
      return "CHORIYA";
         
    case "जागड़ा":
      return "JANGDA";
         
    case "झारी के पाण्डिया":
      return "JHARE KE PANDYA";
         
    case "ठकुरिया":
      return "THAKURIYA";
         
    case "ढिलवारी":
      return "DHILWARI";
         
    case "दनगसिया":
      return "DANGASIYA";
         
    case "धांगा":
      return "DHANGA";
         
    case "नायक":
      return "NAYAK";
         
    case "नाहरमूढा":
      return "NAHARMOODHA";
         
    case "पचगइयां":
      return "PACHGAIYA";
         
    case "पचमेहरिया":
      return "PACHMEHARIYA";
         
    case "पाण्डिया":
      return "PANDIYA";
         
    case "पुनविया":
      return "PUNVIYA";
         
    case "पुरिया":
      return "PURIYA";
         
    case "पूणारावत":
      return "PUNARAWAT";
         
    case "बघोरिया":
      return "BAGHORIYA";
         
    case "बजाज":
      return "BAJAJ";
         
    case "बरैठा":
      return "BARETHA";
         
    case "भण्डारी":
      return "BHANDARI";
         
    case "मिड़ाखुरिया":
      return "MIDAKHURIYA";
         
    case "मूंजी":
      return "MOONJI";
         
    case "मेंहतिया":
      return "MAHTIYA";
         
    case "महोरिया":
      return "MOHARIYA";
         
    case "रनपुरिया":
      return "RANPURIYA";
         
    case "रावत":
      return "RAWAT";
         
    case "लखेश्वरी":
      return "LAKHESHWARI";
         
    case "लखेश्वरी":
      return "LOHARIYA";
         
    case "साहबजाज":
      return "SHAHBAJAJ";
         
    case "सुथनिया":
      return "SUTHANIYA";
         
    case "संडा":
      return "SANDA";
         
    case "साहुला":
      return "SAHULA";
         


    default:
      return "NA";
  }
}


class Search1 extends StatefulWidget{
  final List<PersonalProfilewithc>profiles;
  final String mstatus,gender,selfddvalue,titie;

  Search1(this.profiles,this.mstatus, this.gender,this.selfddvalue, this.titie);
  @override
  _searchoneState createState()=>_searchoneState();

}

class _searchoneState extends State<Search1>{

  String? mamagotraddvalue="NA";

  List<PersonalProfilewithc>fileredprofiles=[];

  void _filtername(value){
    if(mamagotraddvalue=="NA"){
      setState(() {
        fileredprofiles=widget.profiles;
      });

    }
    else {
      setState(() {
        fileredprofiles = widget.profiles.where((profiles) =>
            profiles.GotraMother!.toLowerCase().contains(
                value.toLowerCase())

        ).toList();
        //print(fileredprofiles[0]);

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.purple,

        body:ListView(
          children: [
            SizedBox(height: 30,),

            Column(
              children: [
                Text
                  ("अविवाहित प्रतिभाए प्रस्तुति समूह",
                  style: TextStyle
                    (
                      fontSize: 22
                      ,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 60,),
            Column(
              children: [
                _setState(fileredprofiles),

              ],
            ),

            SizedBox(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(padding: EdgeInsets.symmetric(vertical: 50.0,horizontal: 30.0),),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                              child:Text("मामा का गोत्र",style: TextStyle(fontSize: 30,color: Colors.white),)
                          )
                      ),

                      SizedBox(height:30),
                      Container(width: 200,
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        decoration: BoxDecoration(color:Colors.white,
                            borderRadius:BorderRadius.circular(10.0) ),

                        child:DropdownButton<String>(
                          value:mamagotraddvalue,

                          hint: Text("स्वयं का गोत्र",style: TextStyle(fontSize: 25),),
                          // icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 20,
                          onChanged: (String? newValue){
                            setState(() {
                              mamagotraddvalue=newValue;
                              _filtername(getgotraninenglish(newValue));
                            });
                          },
                          items:<String>[
                            "NA",
                            "अगरैया",
                            "उचाड़िया",
                            "उन्नेरिया",
                            "कठेरिया",
                            "कोटिया",
                            "कपरिया",
                            "कोलानायक",
                            "कुहेले",
                            "गढ़ा के शाह",
                            "गन्धी",
                            "घीया",
                            "चड़ोसिया",
                            "चिकनिया",
                            "चौरिया",
                            "जागड़ा",
                            "झारी के पाण्डिया",
                            "ठकुरिया",
                            "ढिलवारी",
                            "दनगसिया",
                            "धांगा",
                            "नायक",
                            "नाहरमूढा",
                            "पचगइयां",
                            "पचमेहरिया",
                            "पाण्डिया",
                            "पुनविया",
                            "पुरिया",
                            "पूणारावत",
                            "बघोरिया",
                            "बजाज",
                            "बरैठा",
                            "भण्डारी",
                            "मिड़ाखुरिया",
                            "मूंजी",
                            "मेंहतिया",
                            "महोरिया",
                            "रनपुरिया",
                            "रावत",
                            "लखेश्वरी",
                            "लोहरिया",
                            "साहबजाज",
                            "सुथनिया",
                            "संडा",
                            "साहुला"

                          ]
                              .map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value:value,
                              child:Text(value),
                            );
                          }).toList(),
                        ),)
                    ],
                  ),
                  SizedBox(height: 70,),
                  SizedBox(height: 50,width: 200,
                    child:  ElevatedButton(onPressed:(){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search3(fileredprofiles,widget.mstatus,widget.gender,widget.selfddvalue,getgotraninenglish(mamagotraddvalue),widget.titie)));
                    } , child: Text("अगला फ़िल्टर जोड़े ",style: TextStyle(fontSize: 20),)
                        ,style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.red)
                              )
                          ),

                        )),),
                  SizedBox(height: 20,),
                  SizedBox(height: 50,width: 200,
                    child:  ElevatedButton(onPressed:(){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FilteredProfiles(fileredprofiles,widget.mstatus)));
                    } , child: Text("प्रोफाइल देखे",style: TextStyle(fontSize: 20),)
                        ,style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.green)
                              )
                          ),

                        )),)






                ],
              ),

            ),



          ],
        )




    );

  }

  _setState(data) {

    return (Text(widget.titie+"+"+getgotrainhindi(widget.selfddvalue)!+" \nमें कुल प्रोफाइल जिनका मामा का गोत्र\n" +mamagotraddvalue!+ " है : "+fileredprofiles.length.toString(),style: TextStyle(color: Colors.white,fontSize: 25),));
  }

}


class Search3 extends StatefulWidget{
  final List<PersonalProfilewithc>profiles;
  final String mstatus,gender,selfddvalue,mamagotra,titie;

  Search3(this.profiles,this.mstatus, this.gender,this.selfddvalue,this.mamagotra, this.titie);
  @override
  _searchthreeState createState()=>_searchthreeState();

}

class _searchthreeState extends State<Search3>{

  String? qualification="NA";

  List<PersonalProfilewithc>fileredprofiles=[];

  void _filtername(value){
    if(qualification=="NA"){
      setState(() {
        fileredprofiles=widget.profiles;
      });

    }
    else {
      setState(() {
        fileredprofiles = widget.profiles.where((profiles) =>
            profiles.Qualification!.toLowerCase().contains(
                value.toLowerCase())

        ).toList();
        //print(fileredprofiles[0]);

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.purple,

        body:ListView(
          children: [
            SizedBox(height: 30,),
            Column(
              children: [
                Text
                  ("अविवाहित प्रतिभाए प्रस्तुति समूह",
                  style: TextStyle
                    (
                      fontSize: 22
                      ,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 60,),
            Column(
              children: [
                _setState(fileredprofiles),

              ],
            ),
            SizedBox(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(padding: EdgeInsets.symmetric(vertical: 50.0,horizontal: 30.0),),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                              child:Text("Qualification/शिक्षा",style: TextStyle(fontSize: 30,color: Colors.white),)
                          )
                      ),

                      SizedBox(height:50),
                      Container(width: 200,
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        decoration: BoxDecoration(color:Colors.white,
                            borderRadius:BorderRadius.circular(10.0) ),

                        child:DropdownButton<String>(
                          value:qualification,

                          hint: Text("स्वयं का गोत्र",style: TextStyle(fontSize: 25),),
                          // icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 20,
                          onChanged: (String? newValue){
                            setState(() {
                              qualification=newValue;
                              _filtername(newValue);
                            });
                          },
                          items:<String>[
                            "NA",
                            "M.A",
                            "Intermediate",
                            "MBA",
                            "B.Tech",
                            "B.COM",
                            "M.COM",
                            "B.E",
                            "HIGHER SEC",
                            "B.A",
                            "MBBS",
                            "B.SC",
                            "MIDDILE",
                            "BCA",
                            "BBA",
                            "MCA",
                            "GRADUATION",
                            "POST GRADUATION",
                            "CA",
                            "LLB",
                            "DIPLOMA",
                            "M.TECH",
                            "BAMS",
                            "M.PHARMA",
                            "B.PHARMA"


                          ]
                              .map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value:value,
                              child:Text(value),
                            );
                          }).toList(),
                        ),)
                    ],
                  ),
                  SizedBox(height: 70,),
                  SizedBox(height: 50,width: 200,
                    child:  ElevatedButton(onPressed:(){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search2(widget.profiles,widget.mstatus,widget.gender,widget.selfddvalue,widget.mamagotra,qualification,widget.titie)));
                    } , child: Text("अगला फ़िल्टर जोड़े ",style: TextStyle(fontSize: 20),)
                        ,style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.red)
                              )
                          ),

                        )),),
                  SizedBox(height: 50,width: 200,
                    child:  ElevatedButton(onPressed:(){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FilteredProfiles(fileredprofiles,widget.mstatus)));
                    } , child: Text("प्रोफाइल देखे",style: TextStyle(fontSize: 20),)
                        ,style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.green)
                              )
                          ),

                        )),)





                ],
              ),

            ),



          ],
        )




    );

  }

  _setState(data) {

    return (Text(widget.titie+"+"
        +getgotrainhindi(widget.selfddvalue)!+"+"+
        getgotrainhindi(widget.mamagotra)!+
        " \nमें कुल प्रोफाइल जिनकी शिक्षा "+qualification!+ " है : "
        +fileredprofiles.length.toString(),
      style: TextStyle(color: Colors.white,fontSize: 25),));
  }

}




class Search2 extends StatefulWidget{
  final List<PersonalProfilewithc>profiles;
  final String? mstatus,gender,selfddvalue,mamagotra,qualification,titie;

  Search2(this.profiles,this.mstatus, this.gender,this.selfddvalue,this.mamagotra,this.qualification, this.titie);
  @override
  _searchtwoState createState()=>_searchtwoState();

}

class _searchtwoState extends State<Search2>{

  String? profession="NA";

  List<PersonalProfilewithc>fileredprofiles=[];

  void _filtername(value){
    if(profession=="NA"){
      setState(() {
        fileredprofiles=widget.profiles;
      });

    }
    else {
      setState(() {
        fileredprofiles = widget.profiles.where((profiles) =>
            profiles.Profession!.toLowerCase().contains(
                value.toLowerCase())

        ).toList();
        //print(fileredprofiles[0]);

      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.purple,

        body:ListView(
          children: [
            SizedBox(height: 30,),
            Column(
              children: [
                Text
                  ("अविवाहित प्रतिभाए प्रस्तुति समूह",
                  style: TextStyle
                    (
                      fontSize: 22
                      ,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Column(
              children: [
                _setState(fileredprofiles),

              ],
            ),
            SizedBox(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(padding: EdgeInsets.symmetric(vertical: 80.0,horizontal: 30.0),),
                  Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          child:Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),

                              child:Text("Profession",style: TextStyle(fontSize: 30,color: Colors.white),)
                          )
                      ),

                      SizedBox(height:50),
                      Container(width: 250,
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        decoration: BoxDecoration(color:Colors.white,
                            borderRadius:BorderRadius.circular(10.0) ),

                        child:DropdownButton<String>(
                          value:profession,

                          hint: Text("Profession",style: TextStyle(fontSize: 25),),
                          // icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 20,
                          onChanged: (String? newValue){
                            setState(() {
                              profession=newValue;
                              _filtername(newValue);
                            });
                          },
                          items:<String>[
                            "NA",
                            "SOFTWARE ENGINNER",
                            "SUPERVISOR",
                            "CONSULTANT",
                            "ASSISTANT MANAGER",
                            "ACCOUNTANT",
                            "CONTRACTOR",
                            "BANK MANAGER",
                            "INCHARGE",
                            "TEACHER",
                            "DISTRIBUTOR",
                            "MANAGER",
                            "ENTREPRENEUR",
                            "ACCOUNTANT",
                            "ACCOUNT OFFICER",
                            "HEAD",
                            "TEAM LEADER",
                            "AGENT",
                            "DEALER",
                            "INTERN",
                            "PROFESSOR",
                            "ENGINEER",
                            "DESIGNER",
                            "OPERATOR",
                            "BROKER",
                            "LEUTINENT",
                            "ADVOCATE",
                            "ANALYST",
                            "PLANNER",
                            "DEVELOPER",
                            "OBSERVER",
                            "OFFICER",
                            "SCIENTIST",
                            "STENO",
                            "SURVEYOR",
                            "DIRECTOR"


                          ]
                              .map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value:value,
                              child:Text(value),
                            );
                          }).toList(),
                        ),)
                    ],
                  ),
                  SizedBox(height: 70,),

                  SizedBox(height: 50,width: 200,
                    child:  ElevatedButton(onPressed:(){

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FilteredProfiles(fileredprofiles,widget.mstatus)));
                    } , child: Text("प्रोफाइल देखे",style: TextStyle(fontSize: 20),)
                        ,style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.red),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.red)
                              )
                          ),

                        )),),





                ],
              ),

            ),



          ],
        )




    );

  }

  _setState(data) {

    return (Text(widget.titie!+"+"
        +getgotrainhindi(widget.selfddvalue)!+"+"+
        getgotrainhindi(widget.mamagotra)!+"+"+
        widget.qualification!+
        " \nमें कुल प्रोफाइल जिनकी Profession "+profession!+ " है : "
        +fileredprofiles.length.toString(),
        style: TextStyle(color: Colors.white,fontSize: 25),)
    );
  }

}



class SearchwithID extends StatefulWidget {
  const SearchwithID({Key? key}) : super(key: key);

  @override
  _SearchwithIDState createState() => _SearchwithIDState();
}

class _SearchwithIDState extends State<SearchwithID> {

  final TextEditingController _editdetails = TextEditingController();
  final TextEditingController _Sno = TextEditingController();
  bool isloading=false;
  bool issaving=false;
  Widget name=Text("सर्च करने के बाद यहाँ प्रोफाइल नाम आएगा");
  @override
  Widget build(BuildContext context) {
    ProfileController _profile=Get.find();
    return Scaffold(
      appBar: AppBar(title:Text("Search by ID")),
      body: Obx(()=>
         ListView(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0)),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                    padding:EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    child:Column(
                      children: [
                        Container(
                          child: Text(
                            "प्रोफाइल की ID डाले (Profile ID)",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: MediaQuery.of(context).size.width*0.5,
                              decoration: BoxDecoration(
                                  border: Border.all(color:Colors.red)
                              ),
                              child: TextField(
                                controller: _Sno,
                                textCapitalization: TextCapitalization.characters,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    hintText: "Profile ID"
                                ),
                              ),




                            ),
                            SizedBox(width: 10,),
                            Container(
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

                                    child: Icon(Icons.search),
                                    onPressed: () async {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Container(
                                                  height: 100,
                                                  width: 60,
                                                  child:Column(
                                                      children:[
                                                        Center(child:CircularProgressIndicator(),),

                                                        Center(child:Text("Searching Please Wait"),),

                                                      ])
                                              ),


                                            );

                                          });
                                      _profile.getprofileswithsnumber(sno:_Sno.text );
                                      //List<PersonalProfilewithc> Name=await getprofilewithsno(_Sno.text.toUpperCase().trim());
                                    /*  Navigator.pop(context);
                                       setState(() {
                                        isloading=!isloading;

                                        if(Name=="couldnot fetch the data")
                                          name=Text("इस ID से  कोई प्रोफाइल नहीं है ");
                                        else{
                                         name=

                                        }

                                      });*/

                                    }

                                )),



                          ],
                        ),
                        SizedBox(height: 10,),









                      ],
                    )


                ),




              ],
            ),
            _profile.searchedprofile.value.PhotoLink1!=null
                ?Container(
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading:_profile.searchedprofile.value.PhotoLink1!="NA"?
                Image(image: NetworkImage(_profile.searchedprofile.value.PhotoLink1!)):
                Image(image: AssetImage("image/na.jpg")
                ),
                title:getageondate(_profile.searchedprofile.value),
                subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _profile.searchedprofile.value.Gender=="M"?
                    Text("(सुपुत्र "+_profile.searchedprofile.value.Mother!+" एवं "+_profile.searchedprofile.value.Father!+")")
                        :Text("(सुपुत्री "+_profile.searchedprofile.value.Mother!+" एवं "+_profile.searchedprofile.value.Father!+")"),
                    Text(_profile.searchedprofile.value.BirthPlace!),
                  ],
                ),
                trailing: Icon(Icons.navigate_next),
                onTap: ()async{
                  Get.toNamed(AppRoute.individualprofile, arguments: "0");
                  await _profile.getindividualprofiles(id:_profile.searchedprofile.value.id);

                },
              ),
            )
                :Container()











          ],
        ),
      ),


    );
  }


  getageondate(PersonalProfilewithc personalProfilewithc){
    if(personalProfilewithc.DateOfBirth!!="NA") {
      var outputFormat = DateFormat('dd/MM/yyyy');
      var outputDate = outputFormat.parse(personalProfilewithc.DateOfBirth!);

      return Text(
          personalProfilewithc.Name! + " (" + calculateAge(outputDate) +" वर्ष)");
    }else{
      return Text(
          personalProfilewithc.Name! + " (NA वर्ष)");
    }
  }

}
