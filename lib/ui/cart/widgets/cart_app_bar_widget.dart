import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartAppBarWidget extends StatelessWidget {
  final String name;

  const CartAppBarWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: MediaQuery.of(context).size.height *
          LayoutConstants.cartAppBarHeightProportion,
      decoration: BoxDecoration(
        color: ColorsTheme.appBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft:
              Radius.circular(LayoutConstants.orderDetailsBannerBorderRadius),
          bottomRight:
              Radius.circular(LayoutConstants.orderDetailsBannerBorderRadius),
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: LayoutConstants.orderDetailsBannerShadowConfigRadius,
            blurRadius: LayoutConstants.orderDetailsBannerShadowConfigRadius,
            color: ColorsTheme.defaultIconColor.withOpacity(
              LayoutConstants.orderDetailsBannerShadowOpacity,
            ),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *
                LayoutConstants.orderDetailsBannerHeightProportion,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Opacity(
                opacity: LayoutConstants.splashScreenBackgroundOpacity,
                child: SvgPicture.asset(
                  AssetsConstants.splashBackground,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height *
                LayoutConstants.orderDetailsBannerHeightProportion,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: LayoutConstants.orderDetailsBannerContentTopDistance,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: LayoutConstants.orderDetailsBackPageButtonSize,
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.chevron_left_outlined,
                      ),
                    ),
                    Center(
                      child: Text(
                        '${name}',
                        style: AppTextStyleTheme.orderDetailsTitle,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          LayoutConstants.orderDetailsTitleCenterProportion,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
