
import 'package:coffee_hub_app/ui/root/root_controller.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  bool isFirstAccess = false;

  @override
  onInit() {
    super.onInit();
  }

  void goToHome() {
    if (!isFirstAccess) {
      RootController rootController = Get.find();
      rootController.resetTimer();
    }
    isFirstAccess = false;
    Get.back();
  }
}
