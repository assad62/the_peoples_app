abstract class IGeocodingService{
  Future<String> determineAddressFromLatLong(double lat, double long);
}