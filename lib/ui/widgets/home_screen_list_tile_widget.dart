import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:coffee_hub_app/shared/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenListTileWidget extends StatelessWidget {
  final CoffeeModel coffeeModel;

  const HomeScreenListTileWidget({
    Key? key,
    required this.coffeeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: LayoutConstants.homeScreenListViewItemImageFlex,
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
          flex: LayoutConstants.homeScreenSpaceBetweenItemImageAndTextFlex,
          child: SizedBox(
            width: LayoutConstants.homeScreenSpaceBetweenItemImageAndText,
          ),
        ),
        Expanded(
          flex: LayoutConstants.homeScrenListViewTextFlex,
          child: Text(
            coffeeModel.name,
            style: AppTextStyleTheme.defaultTextStyle,
          ),
        ),
        Expanded(
          child: Icon(
            Icons.chevron_right_outlined,
            color: ColorsTheme.coffeeListTileRightIconColor,
          ),
        ),
      ],
    );
  }
}
