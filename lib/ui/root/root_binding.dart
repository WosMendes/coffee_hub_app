import 'package:coffee_hub_app/ui/home_screen/home_screen_controller.dart';
import 'package:coffee_hub_app/ui/root/root_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.put(HomeScreenController());
  }
}
