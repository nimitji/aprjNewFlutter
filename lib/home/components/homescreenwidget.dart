import 'package:aprjnew/addnewbyuser/addProfilebyuser.dart';
import 'package:aprjnew/contact/feedback.dart';
import 'package:aprjnew/contact/updatenote.dart';
import 'package:aprjnew/profiles/Profiles.dart';
import 'package:aprjnew/search/Search.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreenwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack
      (
        children: [

          Column
            (
            children: [

                    Container
                        (padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),

                            child:
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5)),
                                Expanded(child: Column
                                  (
                                  children: [
                                    Padding
                                      (
                                        padding: EdgeInsets.symmetric(vertical: 10.0
                                        )
                                    )
                                    ,
                                    Text
                                      ("अविवाहित प्रतिभाएं प्रस्तुति समूह",
                                      style: TextStyle
                                        (
                                          fontSize: 18
                                          ,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                    ,
                                    Text
                                      ("प्रस्तुत करते हैं ",
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
                                ),)
                              ],
                            )



                    ),
                    Container
                      (

                      color: Colors.transparent, height: 40
                      ,
                      child: Card
                        (
                        color: Colors.transparent,
                        margin: EdgeInsets.symmetric(horizontal: 5
                            ,
                            vertical: 5
                        )
                        ,
                        child: Column
                          (
                          children: [
                            Text
                              ("यहाँ ढूंढे",
                              style: TextStyle
                                (
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                            ,

                          ]
                          ,
                        )
                        ,


                      )
                      ,

                    ),
                    Container(color: Colors.white,
                      child: ExpansionTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "वर (Groom)",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        children: [
                          ListTile(
                              title: Text(
                                "मांगलिक (Manglik)",
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              onTap: () {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Profiles("M","M","मांगलिक वर")));
                              }),
                          Divider(
                            thickness: 1.5,
                          ),
                          ListTile(

                              title: Text(
                                "नॉन मांगलिक (Non-Manglik)",
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              onTap: () {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Profiles("NM","M",'नॉन मांगलिक वर')));
                              }),
                        ],
                      ),
                    ),
                    SizedBox
                      (
                      height: 20
                      ,
                    )
                    ,
                    Container(color:Colors.white,
                     child: ExpansionTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          "वधु (Bride)",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        children: [
                          ListTile(
                              title: Text(
                                "मांगलिक (Manglik)",
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              onTap: () {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Profiles("M","F","मांगलिक वधु")));
                              }),
                          Divider(
                            thickness: 1.5,
                          ),
                          ListTile(

                              title: Text(
                                "नॉन मांगलिक (Non-Manglik)",
                                style:
                                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              onTap: () {

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Profiles("NM","F","नॉन मांगलिक वधु")));
                              }),
                        ],
                      ),

                    ),
              SizedBox
                (
                height: 20
                ,
              )
              ,
              Container
                (
                  height: 60
                  ,width: 400,

                  child: ElevatedButton
                    (
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => SearchwithID()));
                      },

                      style: ButtonStyle
                        (
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.green))
                      , // background
                      child: Text
                        ("ID द्वारा प्रोफाइल सर्च करने के लिए यहाँ दबाएं \n(Search Profile using ID)",
                        style: TextStyle
                          (
                            color: Colors.white, fontSize: 15),))
              ),

                    SizedBox
                      (
                      height: 20
                      ,
                    )
                    ,
                    Container
                      (
                        height: 60
                        ,width: 400,

                        child: ElevatedButton
                          (
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => AddProfileByUser()));
                            },

                            style: ButtonStyle
                              (
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(Colors.purple))
                            , // background
                            child: Text
                              ("नई प्रोफाइल जोड़ने के लिए यहाँ क्लिक करे\n(Click here to Add New Profile)",
                              style: TextStyle
                                (
                                  color: Colors.white, fontSize: 15),))
                    ),
              SizedBox
                (
                height: 20
                ,
              )
              ,
              Container
                (
                  height: 60, width:400,

                  child: ElevatedButton
                    (
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => Feedbackbyuser()));
                      },

                      style: ButtonStyle
                        (
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.redAccent))
                      , // background
                      child: Text
                        ("फीडबैक,सुझाव या सराहना के लिए यहाँ क्लिक करे\n (Feedback,Suggestion or appraisals)",
                        style: TextStyle
                          (
                            color: Colors.white, fontSize: 15),))
              ),

              SizedBox
                (
                height: 20
                ,
              )
              ,
              Container
                (
                  height: 60
                  ,width: 400,

                  child: ElevatedButton
                    (
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => UpdateInfo()));
                      },

                      style: ButtonStyle
                        (
                          backgroundColor: MaterialStateProperty.all<
                              Color>(Colors.blue))
                      , // background
                      child: Text
                        ("स्वयं की प्रोफाइल में परिवर्तन या अपडेट सूचित करे\n Request for change/updates in your profile ",
                        style: TextStyle
                          (
                            color: Colors.white, fontSize: 15),))
              ),

              SizedBox
                (
                height: 50
                ,
              )


            ],

              )
              ,
                       ]

    );
  }
}