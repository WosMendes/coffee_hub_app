import 'dart:convert';

import 'package:coffee_hub_app/core/common/constants/global_constants.dart';
import 'package:coffee_hub_app/core/exceptions/rest_exception.dart';
import 'package:coffee_hub_app/shared/interfaces/i_coffee_hub_mock_api_service.dart';
import 'package:coffee_hub_app/shared/models/coffee_model.dart';
import 'package:http/http.dart';

class CoffeeHubMockApiService implements ICoffeeHubMockApiService {
  Future<List<CoffeeModel>> fetchCoffees() async {
    final endPointUrl =
        Uri.parse('https://6263172c005a66e1e3b1aa6b.mockapi.io/api/v1/coffees');

    var response = await get(endPointUrl);

    if (response.statusCode == GlobalConstants.httpSuccessfulResponseCode) {
      List<dynamic> json = jsonDecode(response.body);

      List<CoffeeModel> coffees =
          json.map((dynamic item) => CoffeeModel.fromMap(item)).toList();

      return coffees;
    } else {
      throw RestException(message: response.statusCode.toString());
    }
  }

  Future<void> postData(Map<String, dynamic> data) async {
    Map<String, dynamic> stringData = {"order": "$data"};
    try {
      final endPointUrl =
          Uri.parse('https://6263172c005a66e1e3b1aa6b.mockapi.io/api/v1/orders');
      await post(endPointUrl, body: stringData);
    } on Exception catch (e) {
      throw RestException(message: e.toString());
    }
  }
}
