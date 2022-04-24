import 'package:coffee_hub_app/ui/root/root_controller.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  onInit() {
    super.onInit();
  }

  void goToHome() {
    RootController rootController = Get.find();
    rootController.resetTimer();
    Get.back();
  }
}
