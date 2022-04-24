import 'package:coffee_hub_app/ui/order_details/order_details_controller.dart';
import 'package:get/get.dart';

class OrderDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailsController());
  }
}
