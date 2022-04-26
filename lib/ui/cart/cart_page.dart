import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/text_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:coffee_hub_app/ui/cart/cart_controller.dart';
import 'package:coffee_hub_app/ui/cart/widgets/cart_app_bar_widget.dart';
import 'package:coffee_hub_app/ui/cart/widgets/cart_list_tile_widget.dart';
import 'package:coffee_hub_app/ui/widgets/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CartAppBarWidget(name: TextConstants.cart),
          Expanded(
            child: ListView.builder(
              itemCount: controller.cart.value.coffees.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(
                    LayoutConstants.cartPageDefaultPadding),
                child: Obx(() => CartListTileWidget(
                      coffeeModel: controller.cart.value.coffees[index],
                      incrementOrderQuantity: () =>
                          controller.incrementOrderQuantity(index),
                      decrementOrderQuantity: () =>
                          controller.decrementOrderQuantity(index),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                LayoutConstants.cartPagetotalContainerPadding),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          TextConstants.total,
                          style: AppTextStyleTheme.orderDetailsTitle,
                        ),
                      ),
                      Expanded(
                        flex: LayoutConstants.cartPageWidgetFlex,
                        child: Divider(
                          thickness: LayoutConstants.cartPageDividerThickness,
                          color: ColorsTheme.dividerColor,
                        ),
                      ),
                      Flexible(
                        child: Obx(() => Text(
                              '\$${controller.cart.value.totalOrderPrice}',
                              style: AppTextStyleTheme.orderDetailsTitle,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: LayoutConstants.cartPageFinishButtonTopPadding,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: LayoutConstants.cartPageWidgetFlex,
                          child: CustomElevatedButtonWidget(
                            text: TextConstants.finish,
                          )),
                      Flexible(
                          child: FloatingActionButton(
                        onPressed: () {},
                        elevation: LayoutConstants
                            .orderDetailsAddToCartButtonElevation,
                        backgroundColor: ColorsTheme.cancelButtonColor,
                        child: SvgPicture.asset(
                          AssetsConstants.cancelButton,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
