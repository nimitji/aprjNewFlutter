import 'package:aprjnew/GlobalUtilities/Controllers/profileController.dart';
import 'package:get/get.dart';
import '../GlobalUtilities/Controllers/app_controller.dart';



class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController(),fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(),fenix: true);

  }
}
