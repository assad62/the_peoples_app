import 'package:permission_handler/permission_handler.dart';

abstract class IPermissionsService {
   Future<PermissionStatus> getFineLocationPermission();
}