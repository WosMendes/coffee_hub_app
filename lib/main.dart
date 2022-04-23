import 'package:coffee_hub_app/core/routes/app_pages.dart';
import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:coffee_hub_app/ui/root/root_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.root,
      initialBinding: RootBinding(),
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
