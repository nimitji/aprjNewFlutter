
import 'package:aprjnew/GlobalUtilities/UnderConstruction/underconstruction.dart';
import 'package:aprjnew/home/components/home_content.dart';
import 'package:aprjnew/home/components/homescreenwidget.dart';
import 'package:aprjnew/profiles/Profiles.dart';
import 'package:aprjnew/user/Login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Constants/app_color.dart';
import '../Constants/assets_path.dart';
import '../GlobalUtilities/Controllers/app_controller.dart';
import '../GlobalUtilities/Controllers/profileController.dart';
import '../Information/information.dart';
import '../addnewbyuser/addProfilebyuser.dart';
import '../contact/feedback.dart';
import '../contact/updatenote.dart';
import '../utilities/services.dart';
import 'Drawer.dart';
import 'components/bottom_nav_bar.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class HomeScreen extends StatelessWidget{
  _makingPhoneCall(String tel) async {
    launch('tel://$tel');

  }
  @override
  Widget build(BuildContext context) {
    AppController appCtrl=Get.find();
    ProfileController _profile = Get.find();
    // TODO: implement build
   return Scaffold(backgroundColor: kshade5,

     body:RefreshIndicator(
       onRefresh:()=> _profile.getprofiles() ,
       child: SafeArea(
         child:   Obx(()=> SingleChildScrollView(child:Column(
             children: [
               //_appBar(),
               if(appCtrl.navBarIndex.value==0)HomeContent(),
               if(appCtrl.navBarIndex.value==1)AddProfileByUser(),
               if(appCtrl.navBarIndex.value==2)Feedbackbyuser(),
               if(appCtrl.navBarIndex.value==3)UpdateInfo(),
               if(appCtrl.navBarIndex.value==4)Column(
                 children: [
                   _appBar(),
                   Container(
                       child: InkWell(
                           child: Container(
                               height: 150,
                               padding: EdgeInsets.symmetric(
                                 vertical: 10.0,
                                 horizontal: 20.0,
                               ),
                               child: Card(
                                   child: Column(
                                     children: [
                                       Container(
                                           child: Column(
                                             children: [
                                               SizedBox(
                                                 height: 20,
                                               ),
                                               Center(
                                                 child: Text(
                                                   "1. रूपेश जैन",
                                                   style: TextStyle(
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.red,
                                                       fontSize: 18),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               Text(
                                                 "उत्तम नगर, दिल्ली" ,
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 17),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               InkWell(onTap: (){
                                                 _makingPhoneCall("+919999977294");
                                               },
                                                 child: Text(
                                                   "99999-77-294" ,
                                                   style: TextStyle(color: Colors.blue,
                                                       fontWeight: FontWeight.bold,
                                                       fontSize: 17),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),


                                             ],
                                           ))
                                     ],


                                   ))))),
                   Container(
                       child: InkWell(
                           child: Container(
                               height: 150,
                               padding: EdgeInsets.symmetric(
                                 vertical: 10.0,
                                 horizontal: 20.0,
                               ),
                               child: Card(
                                   child: Column(
                                     children: [
                                       Container(
                                           child: Column(
                                             children: [
                                               SizedBox(
                                                 height: 20,
                                               ),
                                               Center(
                                                 child: Text(
                                                   "2. श्री अजय जैन",
                                                   style: TextStyle(
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.red,
                                                       fontSize: 18),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               Text(
                                                 "शिवपुरी" ,
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 17),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               InkWell(onTap: (){
                                                 _makingPhoneCall("+919425764033");
                                               },
                                                 child: Text(
                                                   "94257-64033" ,
                                                   style: TextStyle(color: Colors.blue,
                                                       fontWeight: FontWeight.bold,
                                                       fontSize: 17),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),


                                             ],
                                           ))
                                     ],


                                   ))))),
                   Container(
                       child: InkWell(
                           child: Container(
                               height: 150,
                               padding: EdgeInsets.symmetric(
                                 vertical: 10.0,
                                 horizontal: 20.0,
                               ),
                               child: Card(
                                   child: Column(
                                     children: [
                                       Container(
                                           child: Column(
                                             children: [
                                               SizedBox(
                                                 height: 20,
                                               ),
                                               Center(
                                                 child: Text(
                                                   "3. श्री रविन्द्र जी जैन 'जमूसर वाले'",
                                                   style: TextStyle(
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.red,
                                                       fontSize: 18),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               Text(
                                                 "भोपाल" ,
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 17),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               InkWell(onTap: (){
                                                 _makingPhoneCall("+919826365877");
                                               },
                                                 child: Text(
                                                   "98263-65877" ,
                                                   style: TextStyle(color: Colors.blue,
                                                       fontWeight: FontWeight.bold,
                                                       fontSize: 17),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),


                                             ],
                                           ))
                                     ],


                                   ))))),
                   Container(
                       child: InkWell(
                           child: Container(
                               height: 150,
                               padding: EdgeInsets.symmetric(
                                 vertical: 10.0,
                                 horizontal: 20.0,
                               ),
                               child: Card(
                                   child: Column(
                                     children: [
                                       Container(
                                           child: Column(
                                             children: [
                                               SizedBox(
                                                 height: 20,
                                               ),
                                               Center(
                                                 child: Text(
                                                   "4. श्री अनिल जी जैन",
                                                   style: TextStyle(
                                                       fontWeight: FontWeight.bold,
                                                       color: Colors.red,
                                                       fontSize: 18),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               Text(
                                                 "मकराना" ,
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 17),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),
                                               InkWell(onTap: (){
                                                 _makingPhoneCall("+919413037563");
                                               },
                                                 child: Text(
                                                   "94130-37563" ,
                                                   style: TextStyle(color: Colors.blue,
                                                       fontWeight: FontWeight.bold,
                                                       fontSize: 17),
                                                 ),
                                               ),
                                               SizedBox(
                                                 height: 10,
                                               ),


                                             ],
                                           ))
                                     ],


                                   ))))),
                 ],
               ),


             ],
           )),
         )
       ),
     ),
     drawer:Container(
       width: 300,
       child: MyDrawer(),

     ),
     /*floatingActionButton: FloatingActionButton(
       child:Icon(Icons.search),
       onPressed: (){
         Navigator.push(context,
             MaterialPageRoute(builder: (context) => Profiles("NA","NA",
                 "Search")));
       },
     ),*/
     bottomNavigationBar: BottomNavBar(),



   );
  }
  Widget _appBar() {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    subscribetotopic("home",_fcm);
        return Container(height: 70,
          color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            _menuIcon(),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
            "जैसवाल जैन परिणय",
                  style: GoogleFonts.dancingScript (
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }
  Builder _menuIcon() {
    return Builder(
      builder: (BuildContext context) {
        return  IconButton(iconSize: 0,
          icon:SvgPicture.asset(menuIcon,color: Colors.red,),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    );
  }




}

void getdialog(String s, String t,BuildContext context) {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t),
          content: Container(
            height: 60,
            width: 30,
            child: Text(t),
          ),
          actions: <Widget>[
            TextButton(
                child: Text("हां"),
                onPressed: () {

                  SystemNavigator.pop();

                }),

            TextButton(
                child: Text("नहीं"),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Login()),(Route<dynamic>route)=>false);




                }),
          ],
          elevation: 24,
        );
      });
}