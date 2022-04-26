import 'package:coffee_hub_app/shared/interfaces/i_coffee_hub_mock_api_service.dart';
import 'package:coffee_hub_app/shared/services/coffee_hub_mock_api_service.dart';
import 'package:coffee_hub_app/ui/cart/cart_controller.dart';
import 'package:coffee_hub_app/ui/home_screen/home_screen_controller.dart';
import 'package:coffee_hub_app/ui/root/root_controller.dart';
import 'package:get/get.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.lazyPut<ICoffeeHubMockApiService>(() => CoffeeHubMockApiService());
    Get.put(HomeScreenController(Get.find()));
    Get.put(CartController());
  }
}
