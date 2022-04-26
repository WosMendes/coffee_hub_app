import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:coffee_hub_app/shared/models/coffee_model.dart';
import 'package:coffee_hub_app/ui/cart/cart_controller.dart';
import 'package:coffee_hub_app/ui/root/root_controller.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  Rx<CoffeeModel> coffeeModel = CoffeeModel.init().obs;
  var selectedSize = 0.obs;
  var selectedSugar = 0.obs;

  @override
  void onInit() {
    coffeeModel.value = Get.arguments;
    defineInitialQuantity();
    super.onInit();
  }

  void defineInitialQuantity() {
    incrementOrderQuantity();
  }

  void incrementOrderQuantity() {
    coffeeModel.value.quantity++;
    coffeeModel.value.totalItemPrice =
        (coffeeModel.value.price + selectedSize.value) *
            coffeeModel.value.quantity;
    coffeeModel.refresh();
  }

  void decrementOrderQuantity() {
    if (coffeeModel.value.quantity > 0) {
      coffeeModel.value.quantity--;
      coffeeModel.value.totalItemPrice =
          (coffeeModel.value.price + selectedSize.value) *
              coffeeModel.value.quantity;
      coffeeModel.refresh();
    }
  }

  void changeSizeSelection(int currentSelection) {
    selectedSize.value = currentSelection;
    coffeeModel.value.size = currentSelection;
    coffeeModel.value.totalItemPrice =
        (coffeeModel.value.price + selectedSize.value) *
            coffeeModel.value.quantity;
    coffeeModel.refresh();
  }

  void changeSugarSelection(int currentSelection) {
    selectedSugar.value = currentSelection;
    coffeeModel.value.sugar = currentSelection;
    coffeeModel.refresh();
  }

  goToCart() async {
    await Get.toNamed(AppRoutes.cart);
  }

  void addOrderToCart(CoffeeModel coffeeModel) async {
    int coffeeListIndex = 0;
    bool hasSameItem = false;
    CartController cartController = Get.find();
    cartController.cart.value.coffees.forEach((element) {
      if (element.name == coffeeModel.name &&
          element.size == coffeeModel.size &&
          element.sugar == coffeeModel.sugar) {
        element.quantity += coffeeModel.quantity;
        cartController.incrementOrderQuantity(coffeeListIndex, itens: coffeeModel.quantity);
        hasSameItem = true;
      }
      coffeeListIndex++;
    });
    if (!hasSameItem) {
      cartController.cart.value.coffees.add(coffeeModel);
    }
    cartController.calculateTotalOrderPrice();
    RootController rootController = Get.find();
    rootController.getCartItensQuantity();
    rootController.changeTabIndex(1);
    Get.back();
  }
}
