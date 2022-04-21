import 'package:coffee_hub_app/ui/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
