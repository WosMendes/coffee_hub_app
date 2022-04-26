import 'dart:async';

import 'package:coffee_hub_app/core/common/constants/global_constants.dart';
import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:coffee_hub_app/ui/cart/cart_controller.dart';
import 'package:coffee_hub_app/ui/cart/cart_page.dart';
import 'package:coffee_hub_app/ui/home_screen/home_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  Timer timer = Timer(const Duration(), () {});

  final _currentIndex = 0.obs;
  final _bodyContent = <Widget>[].obs;

  get currentIndex => _currentIndex.value;
  set currentIndex(index) => _currentIndex.value = index;

  get bodyContent => _bodyContent;
  set bodyContent(value) => _bodyContent.value = value;

  void changeTabIndex(int index) => currentIndex = index;

  @override
  void onInit() {
    changeTabIndex(Get.arguments ?? 0);
    bodyContent.value = [
      HomeScreenPage(),
      CartPage(),
      Container(),
    ];
    startTimer();
    super.onInit();
  }

  @override
  void onReady() async {
    timer.cancel();
    getCartItensQuantity();
    await pushSplashScreenOnInactivity();
    super.onReady();
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

  int getCartItensQuantity() {
    int itemQuantity = 0;
    CartController cartController = Get.find();
    cartController.cart.value.coffees.forEach((element) {
      itemQuantity += element.quantity;
    });
    return itemQuantity;
  }
}
