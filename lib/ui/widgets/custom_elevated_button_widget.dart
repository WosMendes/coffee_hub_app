import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomElevatedButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutConstants.orderDetailsAddToCartButtonHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(
            LayoutConstants.orderDetailsAddToCartButtonElevation,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  LayoutConstants.orderDetailsAddToCartButtonBorderRadius,
                ),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            ColorsTheme.orderDetailsQuantityIconColor,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyleTheme.addToCartButtonTextStyle,
        ),
      ),
    );
  }
}
