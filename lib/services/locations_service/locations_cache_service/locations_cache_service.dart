abstract class ILocationsCacheService {
  Future<void> saveAddressString(double lat, double long,String address);
  Future<String> getAddressString(double lat, double long);
}