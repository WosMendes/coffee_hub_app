import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyleTheme {
  static const double thirtySixSize = 36.0;
  static const double thirty = 30.0;
  static const double twentyFive = 25.0;
  static const double twentyThree = 23.0;
  static const double twentySize = 20.0;
  static const double eighteenSize = 18.0;
  static const double seventeen = 17.0;
  static const double fourteen = 14.0;

  static final TextStyle homeScreenTitle = TextStyle(
    fontSize: thirtySixSize,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.defaultTextColor,
  );
  static final TextStyle defaultTextStyle = TextStyle(
    fontSize: twentySize,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.defaultTextColor,
  );
  static final TextStyle inCubesTextStyle = TextStyle(
    fontSize: twentySize,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.homeCoffeeTextColor,
  );
  static final TextStyle orderDetailsTitle = TextStyle(
    fontSize: twentyThree,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.defaultTextColor,
  );
  static final TextStyle orderDetailsPrice = TextStyle(
    fontSize: thirty,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.orderDetailsQuantityIconColor,
  );
  static final TextStyle orderDetailsPriceSymbol = TextStyle(
    fontSize: seventeen,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.orderDetailsQuantityIconColor,
  );
  static final TextStyle changeQuantityButtonContent = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: twentySize,
  );
  static final TextStyle addToCartButtonTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: eighteenSize,
  );
  static final TextStyle cartSizeInfoTextStyle = TextStyle(
    fontSize: fourteen,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.coffeeText,
  );
  static final TextStyle cartItemPrice = TextStyle(
    fontSize: twentyFive,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.orderDetailsQuantityIconColor,
  );
}
