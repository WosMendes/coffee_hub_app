import 'package:coffee_hub_app/core/exceptions/rest_exception.dart';
import 'package:coffee_hub_app/shared/interfaces/i_local_repository.dart';
import 'package:get_storage/get_storage.dart';

class LocalRepository implements ILocalRepository {
  final cartData = GetStorage();

  @override
  Map<String, dynamic> readDataByKey(String key) {
    try {
      final response = cartData.read(key) as Map<String, dynamic>;
      return response;
    } catch (e) {
      throw RestException(message: e.toString());
    }
  }

  @override
  Future<void> removeDataByKey(String key) async {
    try {
      await cartData.remove(key);
    } catch (e) {
      throw RestException(message: e.toString());
    }
  }

  @override
  Future<void> writeDataByKey(String key, Map<String, dynamic> value) async {
    try {
      await cartData.write(key, value);
    } catch (e) {
      throw RestException(message: e.toString());
    }
  }
}
