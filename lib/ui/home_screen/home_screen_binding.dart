import 'package:coffee_hub_app/shared/interfaces/i_coffee_hub_mock_api_service.dart';
import 'package:coffee_hub_app/shared/services/coffee_hub_mock_api_service.dart';
import 'package:coffee_hub_app/ui/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICoffeeHubMockApiService>(() => CoffeeHubMockApiService());
    Get.put(HomeScreenController(Get.find()));
  }
}
