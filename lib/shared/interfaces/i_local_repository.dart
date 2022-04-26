abstract class ILocalRepository {
  Map<String, dynamic> readDataByKey(String key);
  Future<void> writeDataByKey(String key, Map<String, dynamic> value);
  Future<void> removeDataByKey(String key);
}
