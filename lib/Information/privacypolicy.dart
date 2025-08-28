import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants/app_color.dart';
import '../Constants/app_text.dart';
import '../Constants/assets_path.dart';
import '../Constants/size.dart';
import '../GlobalUtilities/custom_button.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Prodcontroller _prod=Get.put(Prodcontroller());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                children: [
                  /*ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      aboutImg,
                      height: getScreenHeight(215),
                      width: getScreeWidth(335),
                      fit: BoxFit.cover,
                    ),
                  ),*/
                  getVerticalSpace(20),
                  Text(
                    "Privacy Policy & Terms And Conditions",
                    style: TextStyle(
                      fontSize: getTextSize(17),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  getVerticalSpace(15),
                  Text(
                    privacypolicyText,
                    // textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: getTextSize(15),
                      fontWeight: FontWeight.w400,
                      color: kdarktext,
                      letterSpacing: 0.17,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            getVerticalSpace(20),
            CustomButton(
              widthValue: getScreeWidth(335),
              text: "Back To Previous",
              press: () => Get.back(),
            ),
            getVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
