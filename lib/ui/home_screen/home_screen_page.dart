import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/text_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/app_text_style_theme.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:coffee_hub_app/ui/home_screen/home_screen_controller.dart';
import 'package:coffee_hub_app/ui/widgets/home_screen_list_tile_widget.dart';
import 'package:coffee_hub_app/ui/widgets/search_input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreenPage extends GetView<HomeScreenController> {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorsTheme.appBackgroundColor,
        appBar: controller.hasFilter.value
            ? null
            : AppBar(
                foregroundColor: ColorsTheme.defaultIconColor,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(
                        LayoutConstants.homeScreenAppBarIconsPadding),
                    child: InkWell(
                      onTap: () => controller.toggleSearchTextField(),
                      child: SvgPicture.asset(
                        AssetsConstants.appBarSearchIcon,
                        color: ColorsTheme.defaultIconColor,
                      ),
                    ),
                  )
                ],
              ),
        body: controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorsTheme.orderDetailsQuantityIconColor,
                ),
              )
            : Column(
                children: [
                  controller.hasFilter.value
                      ? Padding(
                          padding: const EdgeInsets.only(
                            left: LayoutConstants
                                .homeScreenSearchFieldLeftPadding,
                            top: LayoutConstants
                                .homeScreenSearchFieldVerticalPadding,
                            bottom: LayoutConstants
                                .homeScreenSearchFieldVerticalPadding,
                            right: LayoutConstants
                                .homeScreenSearchFieldRightPadding,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    controller.toggleSearchTextField(),
                                icon: Icon(Icons.close),
                              ),
                              Expanded(
                                flex: LayoutConstants.homeScreenSearchFieldFlex,
                                child: SearchInputTextWidget(
                                  controller:
                                      controller.searchTextFieldController,
                                  onChanged: (text) =>
                                      controller.createSearchFilter(text),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox.shrink(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal:
                            LayoutConstants.homeScreenTitleHorizontalPadding,
                        vertical:
                            LayoutConstants.homeScreenTitleVerticalPadding,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyleTheme.homeScreenTitle,
                          children: [
                            TextSpan(text: TextConstants.itsAGreat),
                            TextSpan(
                              text: TextConstants.dayForCoffee,
                              style: TextStyle(
                                color: ColorsTheme.homeCoffeeTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                        LayoutConstants.homeScreenspaceBetweenTitleAndListView,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.filteringCoffeesList.value.isEmpty
                          ? controller.coffeesList.length
                          : controller.filteringCoffeesList.value.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () => controller.goToOrderDetails(
                            controller.filteringCoffeesList.value.isEmpty
                                ? controller.coffeesList[index]
                                : controller.filteringCoffeesList.value[index],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: LayoutConstants
                                  .homeScreenListViewVerticalPadding,
                              horizontal: LayoutConstants
                                  .homeScreenListViewHorizontalPadding,
                            ),
                            child: controller.filteringCoffeesList.value.isEmpty
                                ? HomeScreenListTileWidget(
                                    coffeeModel: controller.coffeesList[index],
                                  )
                                : HomeScreenListTileWidget(
                                    coffeeModel: controller
                                        .filteringCoffeesList.value[index],
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
