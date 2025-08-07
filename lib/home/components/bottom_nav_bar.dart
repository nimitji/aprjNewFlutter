import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../Constants/app_color.dart';
import '../../Constants/navbaritems.dart';
import '../../Constants/size.dart';
import '../../GlobalUtilities/Controllers/app_controller.dart';





class BottomNavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AppController navCtrl = Get.find();
    return Obx(
        ()=>Container(
          height: getScreenHeight(50),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          color: Colors.white.withOpacity(0.8),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navBarItems.asMap().entries.map((e) {
              return InkWell(
                onTap: () =>navCtrl.navBarIndex(e.key),
                child: AnimatedContainer(
                  duration: Duration(milliseconds:500 ),
                  curve: Curves.ease,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        navCtrl.navBarIndex.value == e.key
                            ? e.value['active']!
                            : e.value['inactive']!,
                        height: navCtrl.navBarIndex.value == e.key ? 22 : 20,
                        color: navCtrl.navBarIndex.value == e.key
                            ? kdark1
                            : kdarktext,
                      ),
                      getVerticalSpace(8),
                      Text(
                        e.value['label']!,
                        style: TextStyle(
                          fontSize: getTextSize(14),
                          color: navCtrl.navBarIndex.value == e.key
                              ? kdark1
                              : kdarktext,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        )
    );
  }
}
