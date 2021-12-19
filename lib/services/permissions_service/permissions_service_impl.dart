import 'package:flutter_starter_app/services/permissions_service/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService extends IPermissionsService{
  @override
  Future<PermissionStatus> getFineLocationPermission() async{
    return await Permission.locationWhenInUse.request();
  }

}