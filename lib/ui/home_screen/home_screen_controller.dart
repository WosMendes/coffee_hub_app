import 'dart:async';

import 'package:coffee_hub_app/core/exceptions/rest_exception.dart';
import 'package:coffee_hub_app/core/routes/app_routes.dart';
import 'package:coffee_hub_app/shared/interfaces/i_coffee_hub_mock_api_service.dart';
import 'package:coffee_hub_app/shared/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  List<CoffeeModel> coffeesList = <CoffeeModel>[].obs;
  Rx<List<CoffeeModel>> filteringCoffeesList = Rx<List<CoffeeModel>>([]);
  final searchTextFieldController = TextEditingController();
  final RxBool isLoading = true.obs;
  final RxBool hasFilter = false.obs;
  final ICoffeeHubMockApiService _iCoffeeHubMockApiService;

  HomeScreenController(this._iCoffeeHubMockApiService);

  @override
  void onInit() async {
    await onGetCoffees();
    super.onInit();
  }

  Future<List<CoffeeModel>> onGetCoffees() async {
    try {
      coffeesList = await _iCoffeeHubMockApiService.fetchCoffees();
      isLoading.value = false;
      return coffeesList;
    } on RestException catch (e) {
      throw e.message;
    }
  }

  void toggleSearchTextField() {
    hasFilter.toggle();
    filteringCoffeesList.value = coffeesList;
    searchTextFieldController.text = '';
  }

  void createSearchFilter(String text) {
    filteringCoffeesList.value = [];
    if (text.isEmpty) {
      filteringCoffeesList.value = coffeesList;
    } else {
      filteringCoffeesList.value = coffeesList
          .where((item) => item.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
  }

  void goToOrderDetails(CoffeeModel coffeeModel) async {
    await Get.toNamed(AppRoutes.orderDetails, arguments: coffeeModel);
    await onGetCoffees();
  }
}
