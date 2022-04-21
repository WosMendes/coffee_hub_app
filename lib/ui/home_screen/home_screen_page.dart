import 'package:coffee_hub_app/ui/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenPage extends GetView<HomeScreenController> {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => controller.resetTimer(),
      child: const Scaffold(
        body: Center(
          child: Text('Teste'),
        ),
      ),
    );
  }
}
