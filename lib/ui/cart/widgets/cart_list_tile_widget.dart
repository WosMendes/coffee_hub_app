import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/text_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/shared/models/coffee_model.dart';
import 'package:coffee_hub_app/ui/widgets/change_coffee_quantity_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartListTileWidget extends StatelessWidget {
  final CoffeeModel coffeeModel;
  final VoidCallback incrementOrderQuantity;
  final VoidCallback decrementOrderQuantity;

  const CartListTileWidget({
    Key? key,
    required this.coffeeModel,
    required this.incrementOrderQuantity,
    required this.decrementOrderQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: LayoutConstants.flexTwo,
          child: Transform.scale(
            scale: LayoutConstants.homeScreenListViewItemImageScale,
            child: SvgPicture.asset(
              coffeeModel.image,
              alignment: Alignment.center,
              fit: BoxFit.none,
              clipBehavior: Clip.none,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: LayoutConstants.cartListTilePadding,
          ),
        ),
        Expanded(
          flex: LayoutConstants.cartListTileCoffeeNameFlex,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffeeModel.name,
                style: AppTextStyleTheme.defaultTextStyle,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${getSizeByNumber(coffeeModel.size)} ',
                      style: AppTextStyleTheme.cartSizeInfoTextStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      TextConstants.size,
                    ),
                  ),
                ],
              ),
              Transform.scale(
                alignment: Alignment.centerLeft,
                scale: LayoutConstants.cartListTileSugarScale,
                child: getSugarInfo(
                  coffeeModel.sugar,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: LayoutConstants.flexFive,
          child: Column(
            children: [
              ChangeCoffeeQuantityButtonWidget(
                coffeeQuantity: coffeeModel.quantity,
                incrementQuantity: incrementOrderQuantity,
                decrementQuantity: decrementOrderQuantity,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '\$${coffeeModel.totalItemPrice}',
                  style: AppTextStyleTheme.cartItemPrice,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String getSizeByNumber(int size) {
  if (size == 0) {
    return 'S';
  } else if (size == 1) {
    return 'M';
  }
  return 'L';
}

Widget getSugarInfo(int sugar) {
  if (sugar == 0) {
    return SvgPicture.asset(
      AssetsConstants.unselectedZeroSugar,
    );
  } else if (sugar == 1) {
    return SvgPicture.asset(
      AssetsConstants.selectedSugar,
    );
  } else if (sugar == 2) {
    return Row(
      children: [
        SvgPicture.asset(AssetsConstants.selectedSugar),
        SizedBox(
          width: LayoutConstants.orderDetailsThreeSugarsWidth,
        ),
        SvgPicture.asset(AssetsConstants.selectedSugar),
      ],
    );
  }
  return Row(
    children: [
      SvgPicture.asset(AssetsConstants.selectedSugar),
      SizedBox(
        width: LayoutConstants.orderDetailsThreeSugarsWidth,
      ),
      SvgPicture.asset(AssetsConstants.selectedSugar),
      SizedBox(
        width: LayoutConstants.orderDetailsThreeSugarsWidth,
      ),
      SvgPicture.asset(AssetsConstants.selectedSugar),
    ],
  );
}
