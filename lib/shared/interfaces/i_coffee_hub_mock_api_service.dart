import 'package:coffee_hub_app/shared/models/coffee_model.dart';

abstract class ICoffeeHubMockApiService {
  Future<List<CoffeeModel>> fetchCoffees();
}
