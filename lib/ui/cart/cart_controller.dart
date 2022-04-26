import 'package:coffee_hub_app/shared/models/cart_model.dart';
import 'package:coffee_hub_app/shared/models/coffee_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final Rx<CartModel> cart = CartModel.init().obs;

  @override
  void onInit() async {
    calculateTotalOrderPrice();
    super.onInit();
  }

  void initList() {
    cart.value.coffees.add(
      CoffeeModel(
        id: '1',
        name: 'Espresso',
        size: 1,
        sugar: 3,
        quantity: 1,
        price: 2.00,
        image: 'assets/images/espresso.svg',
        totalItemPrice: 3.00,
      ),
    );
    cart.value.coffees.add(
      CoffeeModel(
        id: '2',
        name: 'Mocha',
        size: 2,
        sugar: 2,
        quantity: 2,
        price: 5.00,
        image: 'assets/images/mocha.svg',
        totalItemPrice: 14.00,
      ),
    );
  }

  void calculateTotalOrderPrice() {
    cart.value.totalOrderPrice = 0;
    cart.value.coffees.forEach((element) {
      cart.value.totalOrderPrice += element.totalItemPrice.toDouble();
    });
    cart.refresh();
  }

  void incrementOrderQuantity(int index, {int? itens = 1}) {
    cart.value.coffees[index].quantity++;
    cart.value.coffees[index].totalItemPrice =
        (cart.value.coffees[index].price + cart.value.coffees[index].size) *
            cart.value.coffees[index].quantity;
    calculateTotalOrderPrice();
    cart.refresh();
  }

  void decrementOrderQuantity(int index) {
    if (cart.value.coffees[index].quantity > 0) {
      cart.value.coffees[index].quantity--;
      cart.value.coffees[index].totalItemPrice =
          (cart.value.coffees[index].price + cart.value.coffees[index].size) *
              cart.value.coffees[index].quantity;
      calculateTotalOrderPrice();
      cart.refresh();
    }
  }
}
