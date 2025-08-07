import 'package:aprjnew/GlobalUtilities/UnderConstruction/underconstruction.dart';
import 'package:aprjnew/profiles/IndividualProfile.dart';
import 'package:aprjnew/profiles/Profiles.dart';
import 'package:get/get.dart';

import '../Information/privacypolicy.dart';
import '../home/HomeScreen.dart';
import '../splashscreen/SplashScreen.dart';
import '../splashscreen/Welcome.dart';
import '../user/Login.dart';


class AppRoute{
  static const String splash='/splash';
  static const String welcome='/welcome';
  static const String homescreen='/HomeScreen';
  static const String login='/Login';
  static const String profile='/Profile';
  static const String individualprofile='/IndividualProfile';
  static const String underconstruction='/Underconstruction';
  static const String privacypolicy='/Privacypolicy';




  static List<GetPage>getPage=[
    GetPage(name: splash, page:()=>SpScreen()),
    GetPage(name: homescreen, page:()=>HomeScreen()),
    GetPage(name: welcome, page:()=>WelcomeScreen()),
    GetPage(name: login, page:()=>Login()),
    GetPage(name: profile, page:()=>ProfileList()),
    GetPage(name: individualprofile, page:()=>IndividualProfile()),
    GetPage(name: underconstruction, page:()=>UnderConstruction()),
    GetPage(name: privacypolicy, page:()=>PrivacyPolicy()),



  ];




}