
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyleTheme {
  
  static const double thirtySixSize = 36.0;
  static const double twentySize = 20.0;

  static final TextStyle homeScreenTitle = TextStyle(
    fontSize: thirtySixSize,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.defaultTextColor,
  );
  static final TextStyle homeScreenListViewText = TextStyle(
    fontSize: twentySize,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.defaultTextColor,
  );
}