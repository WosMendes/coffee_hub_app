import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final BottomNavigationBar bottomNavigationBarContent;

  const CustomBottomNavigationBar({
    Key? key,
    required this.bottomNavigationBarContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutConstants.bottomNavigationBarHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            LayoutConstants.bottomNavigationBarBorderRadius,
          ),
          topLeft: Radius.circular(
            LayoutConstants.bottomNavigationBarBorderRadius,
          ),
        ),
        boxShadow: [
          BoxShadow(
              color: ColorsTheme.bottomNavigationBarShadowColor,
              spreadRadius:
                  LayoutConstants.bottomNavigationBarBoxShadowSpreadRadius,
              blurRadius:
                  LayoutConstants.bottomNavigationBarBoxShadowBlurRadius),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft:
              Radius.circular(LayoutConstants.bottomNavigationBarBorderRadius),
          topRight:
              Radius.circular(LayoutConstants.bottomNavigationBarBorderRadius),
        ),
        child: bottomNavigationBarContent,
      ),
    );
  }
}
