import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:flutter/material.dart';

class SearchInputTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String text) onChanged;
  const SearchInputTextWidget({Key? key, required this.controller, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: ColorsTheme.defaultIconColor,
            ),
      ),
      child: TextFormField(
        autofocus: true,
        onEditingComplete: () => FocusScope.of(context).unfocus(),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
