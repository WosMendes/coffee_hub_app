import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/core/common/constants/themes/colors_theme.dart';
import 'package:coffee_hub_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => controller.resetTimer(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Obx(
          () => Scaffold(
            backgroundColor: ColorsTheme.appBackgroundColor,
            body: controller.bodyContent.elementAt(controller.currentIndex),
            bottomNavigationBar: CustomBottomNavigationBar(
              bottomNavigationBarContent: BottomNavigationBar(
                currentIndex: controller.currentIndex,
                onTap: (index) => controller.currentIndex = index,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      AssetsConstants.bottomNavigationBarItemHome,
                      color: ColorsTheme.bottomNavigationBarItemColor,
                    ),
                    label: '',
                    icon: SvgPicture.asset(
                      AssetsConstants.bottomNavigationBarItemHome,
                      color:
                          ColorsTheme.bottomNavigationBarItemColor.withOpacity(
                        LayoutConstants
                            .bottomNavigationBarItemUnselectedOpacity,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    activeIcon: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SvgPicture.asset(
                          AssetsConstants.bottomNavigationBarItemCart,
                          color: ColorsTheme.bottomNavigationBarItemColor,
                        ),
                        Transform.translate(
                          offset: Offset(
                              LayoutConstants.rootPageCartContainerOffsetX,
                              LayoutConstants.rootPageCartContainerOffsetY),
                          child: Container(
                            height: LayoutConstants.rootPageCartContainerSize,
                            width: LayoutConstants.rootPageCartContainerSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsTheme.cancelButtonColor,
                            ),
                            child: Text(
                              '${controller.getCartItensQuantity()}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    icon: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SvgPicture.asset(
                          AssetsConstants.bottomNavigationBarItemCart,
                          color: ColorsTheme.bottomNavigationBarItemColor
                              .withOpacity(
                            LayoutConstants
                                .bottomNavigationBarItemUnselectedOpacity,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              LayoutConstants.rootPageCartContainerOffsetX,
                              LayoutConstants.rootPageCartContainerOffsetY),
                          child: Container(
                            height: LayoutConstants.rootPageCartContainerSize,
                            width: LayoutConstants.rootPageCartContainerSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsTheme.cancelButtonColor,
                            ),
                            child: Text(
                              '${controller.getCartItensQuantity()}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    activeIcon: SvgPicture.asset(
                      AssetsConstants.bottomNavigationBarItemProfile,
                      color: ColorsTheme.bottomNavigationBarItemColor,
                    ),
                    icon: SvgPicture.asset(
                      AssetsConstants.bottomNavigationBarItemProfile,
                      color:
                          ColorsTheme.bottomNavigationBarItemColor.withOpacity(
                        LayoutConstants
                            .bottomNavigationBarItemUnselectedOpacity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
