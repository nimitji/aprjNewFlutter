import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AppController {
  var isLoading = false.obs;
  var isUserLogedIn = false.obs;
  var navBarIndex = 0.obs;
  var detailTabIndex = 0.obs;
  var pageController = PageController();
  var carousalIndex = 0.obs;
  var detailsPageScroll = ScrollController();
  var index=0.obs;

  startAtTop() => detailsPageScroll.animateTo(0,
      duration: const Duration(milliseconds:500 ), curve: Curves.ease);

setuserlogged(bool val){

  isUserLogedIn.value=val;
}




}
