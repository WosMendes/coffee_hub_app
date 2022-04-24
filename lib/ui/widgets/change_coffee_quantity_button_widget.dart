import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/text_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class ChangeCoffeeQuantityButtonWidget extends StatelessWidget {
  final int coffeeQuantity;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;

  const ChangeCoffeeQuantityButtonWidget({
    Key? key,
    required this.coffeeQuantity,
    required this.incrementQuantity,
    required this.decrementQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: decrementQuantity,
          child: Container(
            height: LayoutConstants.changeQuantityButtonSize,
            width: LayoutConstants.changeQuantityButtonSize,
            decoration: BoxDecoration(
              color: ColorsTheme.orderDetailsQuantityIconColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    LayoutConstants.changeQuantityButtonBorderRadius),
                bottomLeft: Radius.circular(
                    LayoutConstants.changeQuantityButtonBorderRadius),
              ),
            ),
            child: Center(
              child: Text(
                TextConstants.minus,
                style: AppTextStyleTheme.changeQuantityButtonContent,
              ),
            ),
          ),
        ),
        Container(
          height: LayoutConstants.changeQuantityButtonSize,
          width: LayoutConstants.changeQuantityButtonSize,
          color: Colors.white,
          child: Center(
            child: Text(
              '${coffeeQuantity}',
            ),
          ),
        ),
        GestureDetector(
          onTap: incrementQuantity,
          child: Container(
            height: LayoutConstants.changeQuantityButtonSize,
            width: LayoutConstants.changeQuantityButtonSize,
            decoration: BoxDecoration(
              color: ColorsTheme.orderDetailsQuantityIconColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(
                    LayoutConstants.changeQuantityButtonBorderRadius),
                bottomRight: Radius.circular(
                    LayoutConstants.changeQuantityButtonBorderRadius),
              ),
            ),
            child: Center(
              child: Text(TextConstants.plus,
                  style: AppTextStyleTheme.changeQuantityButtonContent),
            ),
          ),
        ),
      ],
    );
  }
}
