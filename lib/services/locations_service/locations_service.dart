abstract class ILocationService {
  Future<String> getAddress(double lat, double long);
}