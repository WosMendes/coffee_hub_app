import 'package:coffee_hub_app/core/routes/app_pages.dart';
import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:coffee_hub_app/ui/root/root_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(CoffeeHubApp());
}

class CoffeeHubApp extends StatelessWidget {
  final cartData = GetStorage();
  CoffeeHubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: AppRoutes.root,
      initialBinding: RootBinding(),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
