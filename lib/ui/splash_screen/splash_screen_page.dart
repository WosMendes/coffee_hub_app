import 'package:coffee_hub_app/core/common/constants/assets_constants.dart';
import 'package:coffee_hub_app/core/common/constants/layout_constants.dart';
import 'package:coffee_hub_app/ui/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => controller.goToHome(),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
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
            Center(
              child: SvgPicture.asset(
                AssetsConstants.coffeeHubLogo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
