import 'package:aprjnew/Constants/app_color.dart';
import 'package:aprjnew/GlobalUtilities/Controllers/profileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

import '../Constants/routedart.dart';
import '../Constants/size.dart';
import '../utilities/Helpers/shimmer_effect_loader.dart';


class HotProducts extends StatelessWidget {
const HotProducts(this.count, this.type);
  final int? count;
  final String?type;
  @override
  Widget build(BuildContext context) {
    ProfileController _prod = Get.find();
    return Container(
      height: ResponsiveSize.screenHeight * 0.15,
     // margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
       width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: ScrollController(
          keepScrollOffset: false,
        ),
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: count!,
        // padding: EdgeInsets.only(left: 15, bottom: 20),
        /*gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.5,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),*/
        shrinkWrap: true,

        itemBuilder: (ctx, index) {
          return Obx(()=>
              _prod.isLoading.value?
             ShimmerLoader(height:getScreeWidth(90) ,):
          HotItem(index: index,type: type));





        },
      ),
    );
  }


}

class HotItem extends StatelessWidget {
  const HotItem({required this.index, this.type});

  final int? index;
  final String? type;

  @override
  Widget build(BuildContext context) {
    ProfileController _prod=Get.find();
    final item =getproductslist(_prod);
    return _prod.isLoading.value?ShimmerLoader(height: 100,):
    InkWell(
      onTap: () async {
        Get.toNamed(AppRoute.individualprofile, arguments: "$index");
        await _prod.getindividualprofiles(id:item.id);

      },
      child: Container(
         width: getScreeWidth(140),
         height: getScreenHeight(90),
         //margin: EdgeInsets.only(right: 15),
        decoration: const BoxDecoration(
          color: kshade5,
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: getScreenHeight(80),
                  width: double.infinity,
                  child: Hero(
                    tag: "$index+$type",
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: FadeInImage.memoryNetwork(
                        image: item.PhotoLink1!,
                        fit: BoxFit.fitHeight, placeholder: kTransparentImage,
                      ),
                    ),
                  ),
                ),
              ),
              getVerticalSpace(5),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item.Name!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: getTextSize(12),
                      ),
                    ),



                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getproductslist(ProfileController prod) {
    switch(type){
      case "male":
        return prod.maleprofiles[index!];
      case "female":
        return prod.femaleprofiles[index!];
      case "special":
        return prod.specialProfiles[index!];
      default:
        return prod.profiles[index!];
    }

  }
}

