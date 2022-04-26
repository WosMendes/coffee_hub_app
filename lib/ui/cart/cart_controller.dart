import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/text_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:coffee_hub_app/core/exceptions/rest_exception.dart';
import 'package:coffee_hub_app/shared/models/cart_model.dart';
import 'package:coffee_hub_app/shared/services/coffee_hub_mock_api_service.dart';
import 'package:coffee_hub_app/ui/widgets/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final Rx<CartModel> cart = CartModel.init().obs;

  @override
  void onInit() async {
    calculateTotalOrderPrice();
    super.onInit();
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

  void openConfirmationModal() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(8),
      titlePadding: const EdgeInsets.only(top: 40),
      title: TextConstants.thanks,
      content: Center(
        child: Container(
          color: Colors.white,
          height: LayoutConstants.confirmDialogHeight,
          width: LayoutConstants.confirmDialogWidth,
          child: Center(
              child: Column(
            children: [
              Text(TextConstants.haveAGoodCoffee),
              Transform.scale(
                scale: 0.8,
                child: SvgPicture.asset(AssetsConstants.coffeeHubLogo),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  child: CustomElevatedButtonWidget(
                    text: TextConstants.ok,
                    onPressed: () => registerOrder(
                      cart.value,
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void openCancelationModal() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      titlePadding: const EdgeInsets.only(top: 40),
      title: TextConstants.areYouSure,
      content: Center(
        child: Container(
          height: LayoutConstants.cancelDialogHeight,
          width: LayoutConstants.cancelDialogWidth,
          child: Center(
              child: Column(
            children: [
              Text(
                TextConstants.confirmingWillRemove,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: CustomElevatedButtonWidget(
                          text: TextConstants.confirm,
                          onPressed: () => cancelOrder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Container(
                        child: CustomElevatedButtonWidget(
                          text: TextConstants.dontCancel,
                          onPressed: () => Get.back(),
                          color: ColorsTheme.cancelButtonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void registerOrder(CartModel orders) async {
    try {
      if (orders.coffees.isNotEmpty) {
        await CoffeeHubMockApiService().postData(orders.toMap());
      }
      cart.value.totalOrderPrice = 0;
      cart.value.coffees.clear();
      cart.refresh();
      Get.back();
    } on RestException catch (e) {
      throw e.statusCode.toString();
    }
  }

  void cancelOrder() async {
    cart.value.totalOrderPrice = 0;
    cart.value.coffees.clear();
    cart.refresh();
    Get.back();
  }
}
