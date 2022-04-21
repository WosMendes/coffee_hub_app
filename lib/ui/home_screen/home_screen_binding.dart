
import 'package:coffee_hub_app/ui/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
  }
}
