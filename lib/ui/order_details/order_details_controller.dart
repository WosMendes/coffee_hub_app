import 'package:coffee_hub_app/shared/models/coffee_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final Rx<CoffeeModel> coffeeModel = CoffeeModel.init().obs;
  var quantity = 0.obs;
  var selectedSize = 0.obs;
  var selectedSugar = 0.obs;

  @override
  void onInit() {
    coffeeModel.value = Get.arguments;
    defineInitialQuantity();
    super.onInit();
  }

  void defineInitialQuantity() {
    coffeeModel.value.quantity = 0;
    coffeeModel.value.quantity++;
  }

  void incrementOrderQuantity() {
    coffeeModel.value.quantity++;
    coffeeModel.refresh();
  }

  void decrementOrderQuantity() {
    if (coffeeModel.value.quantity > 0) {
      coffeeModel.value.quantity--;
      coffeeModel.refresh();
    }
  }

  void changeSizeSelection(int currentSelection) {
    selectedSize.value = currentSelection;
  }

  void changeSugarSelection(int currentSelection) {
    selectedSugar.value = currentSelection;
  }
}
