import 'package:coffee_hub_app/ui/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
