import 'package:aprjnew/Constants/assets_path.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:get/get.dart';
import '../../Constants/app_color.dart';
import '../../Constants/photolist.dart';
import '../../Constants/size.dart';
//import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdBannerPanel extends StatefulWidget {
  @override
  _AdBannerPanelState createState() => _AdBannerPanelState();
}

class _AdBannerPanelState extends State<AdBannerPanel> {
  //CarouselController carouselController=CarouselController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(left: 10, right: 10.0, top: 10, bottom: 15),
      height: getScreenHeight(170),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            items: bannerlist.map((item) => BannerItem(item: item)).toList(),
            //carouselController: carouselController,
            options: CarouselOptions(
              autoPlay: true,
              initialPage: 0,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              reverse: false,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  bannerlist
                      .asMap()
                      .entries
                      .map(
                        (entry) => Container(
                          width: entry.key == _index ? 8.0 : 6.0,
                          height: entry.key == _index ? 8.0 : 6.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                entry.key == _index
                                    ? kPrimaryColor
                                    : Colors.white,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerPanel extends StatefulWidget {
  @override
  _BannerPanelState createState() => _BannerPanelState();
}

class _BannerPanelState extends State<BannerPanel> {
  //CarouselController carouselController=CarouselController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(left: 10, right: 10.0, top: 10, bottom: 15),
      height: getScreenHeight(170),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            items: bannerlist.map((item) => BannerItem(item: item)).toList(),
            //carouselController: carouselController,
            options: CarouselOptions(
              autoPlay: true,
              initialPage: 0,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              reverse: false,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  bannerlist
                      .asMap()
                      .entries
                      .map(
                        (entry) => Container(
                          width: entry.key == _index ? 8.0 : 6.0,
                          height: entry.key == _index ? 8.0 : 6.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                entry.key == _index
                                    ? kPrimaryColor
                                    : Colors.white,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class MainBannerPanel extends StatefulWidget {
  const MainBannerPanel({Key? key}) : super(key: key);

  @override
  State<MainBannerPanel> createState() => _MainBannerPanelState();
}

class _MainBannerPanelState extends State<MainBannerPanel> {
  //CarouselController carouselController=CarouselController();

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    //AppController _app = Get.find();

    return Container(
      //margin: const EdgeInsets.only(left: 10, right: 10.0, top: 10, bottom: 15),
      height: getScreenHeight(150),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            items: mainbanner.map((item) => BannerItem(item: item)).toList(),
            //carouselController: carouselController,
            options: CarouselOptions(
              autoPlay: true,
              initialPage: 0,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              reverse: false,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  mainbanner
                      .asMap()
                      .entries
                      .map(
                        (entry) => Container(
                          width: entry.key == _index ? 8.0 : 6.0,
                          height: entry.key == _index ? 8.0 : 6.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                entry.key == _index
                                    ? kPrimaryColor
                                    : Colors.white,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({Key? key, this.item}) : super(key: key);
  final BannerModel? item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        /*  ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child:  FadeInImage.assetNetwork(
            image: item!.img!,
            fit: BoxFit.fill,
            placeholder:banner2,
          ),
        ),*/
        ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item!.img!),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SpecialProfileBanners extends StatefulWidget {
  const SpecialProfileBanners({Key? key}) : super(key: key);

  @override
  State<SpecialProfileBanners> createState() => _SpecialProfileBannersState();
}

class _SpecialProfileBannersState extends State<SpecialProfileBanners> {
  //CarouselController carouselController=CarouselController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(left: 10, right: 10.0, top: 10, bottom: 15),
      height: getScreenHeight(170),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            items: mainbanner.map((item) => BannerItem(item: item)).toList(),
            //carouselController: carouselController,
            options: CarouselOptions(
              autoPlay: true,
              initialPage: 0,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              reverse: false,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                  mainbanner
                      .asMap()
                      .entries
                      .map(
                        (entry) => Container(
                          width: entry.key == _index ? 8.0 : 6.0,
                          height: entry.key == _index ? 8.0 : 6.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 4.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                entry.key == _index
                                    ? kPrimaryColor
                                    : Colors.white,
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
