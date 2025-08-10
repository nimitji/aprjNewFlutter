import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../Constants/app_color.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: InkWell(
          radius: 0,
          onTap: () => Get.back(),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: kdarktext,
              ),

            ],
          ),
        ),
      ),
    );
  }
}



class CustomeBackButtonWhiteColor extends StatelessWidget {
  const CustomeBackButtonWhiteColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: InkWell(
          radius: 0,
          onTap: () => Get.back(),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: Colors.white,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
