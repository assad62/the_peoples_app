import 'package:flutter_starter_app/services/locations_service/locations_geocoding_service/locations_geocoding_service_impl.dart';
import 'package:flutter_starter_app/services/locations_service/locations_service.dart';
import 'package:geocoding/geocoding.dart';

class LocationsService implements ILocationService{

  var _service = LocationsGeocodingService();

  @override
  Future<String> getAddress(double lat, double long) async {
    return await _determineAddressFromLatLong(lat, long);
  }

  Future<String> _determineAddressFromLatLong(double lat, double long)async {

    return await _service.determineAddressFromLatLong(lat, long);


  }



  
}