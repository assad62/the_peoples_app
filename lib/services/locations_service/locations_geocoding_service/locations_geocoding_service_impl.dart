import 'package:flutter_starter_app/services/locations_service/locations_cache_service/locations_cache_service_impl.dart';
import 'package:flutter_starter_app/services/locations_service/locations_geocoding_service/locations_geocoding_service.dart';
import 'package:geocoding/geocoding.dart';

class LocationsGeocodingService implements IGeocodingService{

  var _cacheService = LocationsCacheService();

  Future<String> _determineAddressFromLatLong(double lat, double long) async{
    if(lat != 0.0 && long !=0.0){
      try {

        List<Placemark> placemarks = await placemarkFromCoordinates(lat,long);
        Placemark place = placemarks[0];
        String name = _getNameString(place.name);
        String address = _getAddressString(place.locality);
        String country = _getCountryString(place.country);

        if(name.length !=0 && address.length != 0 && country.length !=0){
          //if any of these values are missing it implies the data is corrupt, so we remove them
          String completeAddress = '$address$name$country';
          await _cacheService.saveAddressString(lat, long, completeAddress);
          return completeAddress;
        }

      } catch(e) {
        //due to rate limiting apple and google dont return results, if so return from cache
        return _cacheService.getAddressString(lat, long);
      }
    }

    return '';
  }

  @override
  Future<String> determineAddressFromLatLong(double lat, double long) async {

      return await _determineAddressFromLatLong(lat, long);
  }



  String _getAddressString (String? address){
    String _address = address ?? "";
    if(_address.length == 0)
      return "";


    return "$_address ,";
  }

  String _getNameString (String? name){
    String _name = name ?? "";
    if(_name.length == 0)
      return "";




    return " $_name -";
  }

  String _getCountryString (String? country){
    String _country = country ?? "";
    if(_country.length == 0)
      return "";


    return "$_country";
  }

}