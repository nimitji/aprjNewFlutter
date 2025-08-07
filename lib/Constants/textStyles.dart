import 'package:aprjnew/Constants/routedart.dart';
import 'package:aprjnew/Constants/size.dart';
import 'package:aprjnew/GlobalUtilities/Controllers/profileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class BoldHeading extends StatelessWidget {
  final String? title;
  final int? size;
  final bool? bold;
  final String?type;
  const BoldHeading({@required this.title,this.size,this.bold,this.type});
  @override
  Widget build(BuildContext context) {
    ProfileController _profile=Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Text(
                "Products",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getTextSize(12),
                  fontWeight: FontWeight.w400,
                ),
              ),*/
              Text(
                title!,textAlign: TextAlign.center,
                style: GoogleFonts.dancingScript (
                  fontSize: size!.toDouble(),
                  fontWeight: bold!?FontWeight.bold:FontWeight.normal,
                  color: Colors.black ,
                ),
              )
            ],
          ),

           ElevatedButton(
             style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
            onPressed: (){
               switch(type){
                 case 'All':
                   _profile.selected.value=_profile.profiles;
                   _profile.title.value="सभी प्रोफाइल";
                   break;
                 case 'Male':
                   _profile.selected.value=_profile.maleprofiles;
                   _profile.title.value="वर चाहिए";
                   break;
                 case 'Female':
                   _profile.selected.value=_profile.femaleprofiles;
                   _profile.title.value="वधु चाहिए";
                   break;
                 case 'Manglik':
                   _profile.selected.value=_profile.manglikprofiles;
                   _profile.title.value="मांगलिक";
                   break;
                 case 'nonManglik':
                   _profile.selected.value=_profile.nonmanglikprofiles;
                   _profile.title.value="नॉन मांगलिक";
                   break;


               }
               Get.toNamed(AppRoute.profile);


            },
             child: Text(
               "सभी दिखाए",
               style: TextStyle(
                color: Colors.white,
                fontSize: getTextSize(12),
                fontWeight: FontWeight.w700,
               ),
             ),
           ),
        ],
      ),
    );
  }
}