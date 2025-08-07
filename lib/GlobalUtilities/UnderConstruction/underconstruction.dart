import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/app_color.dart';
import '../../Constants/assets_path.dart';
import '../../Constants/size.dart';
import '../custom_button.dart';


class UnderConstruction extends StatelessWidget {
  const UnderConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 700,
      child: Center(
        child: Column(
          children: [
            getVerticalSpace(20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                underconst,
                height: getScreenHeight(215),
                width: getScreeWidth(335),
                fit: BoxFit.cover,
              ),
            ),
            getVerticalSpace(20),
            Text(
              "This Section is Under Construction",
              style: TextStyle(
                  fontSize: getTextSize(17), fontWeight: FontWeight.w700),
            ),
            getVerticalSpace(15),
            /*     Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    children: [


                    ],
                  ),
                ),*/
            getVerticalSpace(20),
            CustomButton(
              widthValue: getScreeWidth(335),
              color: kPrimaryColor,
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
