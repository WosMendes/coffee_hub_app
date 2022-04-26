import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/global_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/text_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:coffee_hub_app/ui/order_details/order_details_controller.dart';
import 'package:coffee_hub_app/ui/order_details/widgets/order_details_banner_widget.dart';
import 'package:coffee_hub_app/ui/widgets/change_coffee_quantity_button_widget.dart';
import 'package:coffee_hub_app/ui/widgets/custom_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderDetailsPage extends GetView<OrderDetailsController> {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
            ),
            child: Column(
              children: [
                OrderDetailsBannerWidget(
                  name: controller.coffeeModel.value.name,
                  image: controller.coffeeModel.value.image,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    LayoutConstants.orderDetailsHorizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${controller.coffeeModel.value.name}',
                            style: AppTextStyleTheme.defaultTextStyle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: LayoutConstants
                                  .orderDetailsPriceVerticalPadding,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('\$',
                                    style: AppTextStyleTheme
                                        .orderDetailsPriceSymbol),
                                Text(
                                  '${controller.coffeeModel.value.totalItemPrice}',
                                  style: AppTextStyleTheme.orderDetailsPrice,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ChangeCoffeeQuantityButtonWidget(
                        coffeeQuantity: controller.coffeeModel.value.quantity,
                        incrementQuantity: () =>
                            controller.incrementOrderQuantity(),
                        decrementQuantity: () =>
                            controller.decrementOrderQuantity(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstants.orderDetailsHorizontalPadding,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      TextConstants.size,
                      style: AppTextStyleTheme.defaultTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstants.orderDetailsHorizontalPadding,
                    vertical:
                        LayoutConstants.orderDetailsSizeTextVerticalPadding,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => controller
                            .changeSizeSelection(GlobalConstants.shortSize),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.scale(
                              alignment: Alignment.bottomCenter,
                              scale: LayoutConstants.orderDetailsShortSizeScale,
                              child: SvgPicture.asset(
                                controller.selectedSize.value ==
                                        GlobalConstants.shortSize
                                    ? AssetsConstants.selectedSize
                                    : AssetsConstants.unselectedSize,
                              ),
                            ),
                            SizedBox(
                              height: LayoutConstants
                                  .orderDetailsSelectIndicatorPadding,
                            ),
                            SvgPicture.asset(
                              AssetsConstants.selectIndicator,
                              color: controller.selectedSize.value ==
                                      GlobalConstants.shortSize
                                  ? null
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: LayoutConstants.orderDetailsHorizontalPadding,
                      ),
                      GestureDetector(
                        onTap: () => controller
                            .changeSizeSelection(GlobalConstants.mediumSize),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              controller.selectedSize.value ==
                                      GlobalConstants.mediumSize
                                  ? AssetsConstants.selectedSize
                                  : AssetsConstants.unselectedSize,
                            ),
                            SizedBox(
                              height: LayoutConstants
                                  .orderDetailsSelectIndicatorPadding,
                            ),
                            SvgPicture.asset(
                              AssetsConstants.selectIndicator,
                              color: controller.selectedSize.value ==
                                      GlobalConstants.mediumSize
                                  ? null
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: LayoutConstants
                            .orderDetailsDistanceBetweenMediumAndLargeSize,
                      ),
                      GestureDetector(
                        onTap: () => controller
                            .changeSizeSelection(GlobalConstants.LargeSize),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.scale(
                              alignment: Alignment.bottomCenter,
                              scale: LayoutConstants.orderDetailsLargeSizeScale,
                              child: SvgPicture.asset(
                                controller.selectedSize.value ==
                                        GlobalConstants.LargeSize
                                    ? AssetsConstants.selectedSize
                                    : AssetsConstants.unselectedSize,
                              ),
                            ),
                            SizedBox(
                              height: LayoutConstants
                                  .orderDetailsSelectIndicatorPadding,
                            ),
                            SvgPicture.asset(
                              AssetsConstants.selectIndicator,
                              color: controller.selectedSize.value ==
                                      GlobalConstants.LargeSize
                                  ? null
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstants.orderDetailsHorizontalPadding,
                    vertical:
                        LayoutConstants.orderDetailsSizeTextVerticalPadding,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          TextConstants.sugar,
                          style: AppTextStyleTheme.defaultTextStyle,
                        ),
                        Text(
                          TextConstants.inCubes,
                          style: AppTextStyleTheme.inCubesTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          LayoutConstants.orderDetailsHorizontalPadding),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => controller
                            .changeSugarSelection(GlobalConstants.zeroSugar),
                        child: Column(
                          children: [
                            Transform.translate(
                              offset: Offset(0,
                                  LayoutConstants.orderDetailsZeroSugarYOffset),
                              child: SvgPicture.asset(
                                controller.selectedSugar.value ==
                                        GlobalConstants.zeroSugar
                                    ? AssetsConstants.selectedZeroSugar
                                    : AssetsConstants.unselectedZeroSugar,
                              ),
                            ),
                            SizedBox(
                              height:
                                  LayoutConstants.orderDetailsZeroSugarPadding,
                            ),
                            SvgPicture.asset(
                              AssetsConstants.selectIndicator,
                              color: controller.selectedSugar.value ==
                                      GlobalConstants.zeroSugar
                                  ? null
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: LayoutConstants.orderDetailsHorizontalPadding,
                      ),
                      GestureDetector(
                        onTap: () => controller
                            .changeSugarSelection(GlobalConstants.oneSugar),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              controller.selectedSugar.value ==
                                      GlobalConstants.oneSugar
                                  ? AssetsConstants.selectedSugar
                                  : AssetsConstants.unselectedSugar,
                            ),
                            SizedBox(
                              height: LayoutConstants
                                  .orderDetailsSelectIndicatorPadding,
                            ),
                            SvgPicture.asset(
                              AssetsConstants.selectIndicator,
                              color: controller.selectedSugar.value ==
                                      GlobalConstants.oneSugar
                                  ? null
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: LayoutConstants.orderDetailsDistanceBetweenSugar,
                      ),
                      GestureDetector(
                        onTap: () => controller
                            .changeSugarSelection(GlobalConstants.twoSugars),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  controller.selectedSugar.value ==
                                          GlobalConstants.twoSugars
                                      ? AssetsConstants.selectedSugar
                                      : AssetsConstants.unselectedSugar,
                                ),
                                SizedBox(
                                  width: LayoutConstants
                                      .orderDetailsThreeSugarsWidth,
                                ),
                                SvgPicture.asset(
                                  controller.selectedSugar.value ==
                                          GlobalConstants.twoSugars
                                      ? AssetsConstants.selectedSugar
                                      : AssetsConstants.unselectedSugar,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: LayoutConstants
                                  .orderDetailsSelectIndicatorPadding,
                            ),
                            SvgPicture.asset(
                              AssetsConstants.selectIndicator,
                              color: controller.selectedSugar.value ==
                                      GlobalConstants.twoSugars
                                  ? null
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: LayoutConstants.orderDetailsDistanceBetweenSugar,
                      ),
                      GestureDetector(
                        onTap: () => controller
                            .changeSugarSelection(GlobalConstants.threeSugars),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              controller.selectedSugar.value ==
                                      GlobalConstants.threeSugars
                                  ? AssetsConstants.selectedSugar
                                  : AssetsConstants.unselectedSugar,
                            ),
                            SizedBox(
                              height:
                                  LayoutConstants.orderDetailsThreeSugarsHeight,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  controller.selectedSugar.value ==
                                          GlobalConstants.threeSugars
                                      ? AssetsConstants.selectedSugar
                                      : AssetsConstants.unselectedSugar,
                                ),
                                SizedBox(
                                  width: LayoutConstants
                                      .orderDetailsThreeSugarsWidth,
                                ),
                                SvgPicture.asset(
                                  controller.selectedSugar.value ==
                                          GlobalConstants.threeSugars
                                      ? AssetsConstants.selectedSugar
                                      : AssetsConstants.unselectedSugar,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: LayoutConstants
                                  .orderDetailsSelectIndicatorPadding,
                            ),
                            SvgPicture.asset(
                              AssetsConstants.selectIndicator,
                              color: controller.selectedSugar.value ==
                                      GlobalConstants.threeSugars
                                  ? null
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height:
                      LayoutConstants.orderDetailsAddToCartButtonTopDistance,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstants
                        .orderDetailsAddToCartButtonHorizontalPadding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: LayoutConstants.orderDetailsAddToCartButtonFlex,
                        child: CustomElevatedButtonWidget(
                          text: TextConstants.addToCart,
                          onPressed: () => controller
                              .addOrderToCart(controller.coffeeModel.value),
                        ),
                      ),
                      Expanded(
                        child: FloatingActionButton(
                          backgroundColor:
                              ColorsTheme.orderDetailsQuantityIconColor,
                          elevation: LayoutConstants
                              .orderDetailsAddToCartButtonElevation,
                          onPressed: () => controller.goToCart(),
                          child: Icon(Icons.shopping_cart_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: LayoutConstants.orderDetailsPageBottomDistance,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
