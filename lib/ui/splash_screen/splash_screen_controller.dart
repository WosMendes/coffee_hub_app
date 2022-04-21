import 'dart:async';

import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:coffee_hub_app/ui/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  bool isFirstAccess = false;

  @override
  onInit() {
    isFirstAccess = true;
    super.onInit();
  }

  Future<void> goToHome() async {
    if (!isFirstAccess) {
      HomeScreenController homeScreenController = Get.find();
      homeScreenController.resetTimer();
    }
    isFirstAccess = false;
    await Get.offAndToNamed(AppRoutes.homeScreen);
  }
}
