
import 'package:aprjnew/classes/homescreen.dart';

import '../services/profileservices.dart';
import 'basecontroller.dart';
import 'package:get/get.dart';
class HomeScreenController extends GetxController with BaseController {
  var isLoading = false.obs;
  var errorMsg = "".obs;
  var homeScreeData = HomeScreenModel().obs;

  @override
  void onInit() {
    gethomescreendata();
  }

  Future gethomescreendata() async {
    //print("getbannercalled");
    try {
      isLoading(true);
      final result = await ProfileServices.instance.getHomeScreenData();
      if (result['code'] != 200) {
        errorMsg.value = result['data'];
      } else {
        homeScreeData(result['data']);
      }
      update();
    } catch (e) {
      print(e);
      handleError(e);
    } finally {
      isLoading(false);
    }
  }

}
