import 'dart:async';

import 'package:coffee_hub_app/core/common/constants/global_constants.dart';
import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  Timer timer = Timer(const Duration(), () {});

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Timer startTimer() {
    return Timer.periodic(
      const Duration(
        seconds: GlobalConstants.splashScreenCountdownTimer,
      ),
      (timer) {
        pushSplashScreenOnInactivity();
        timer.cancel();
      },
    );
  }

  void resetTimer() {
    timer.cancel();
    timer = startTimer();
  }

  Future<void> pushSplashScreenOnInactivity() async {
    await Get.toNamed(AppRoutes.splashScreen);
  }
}
