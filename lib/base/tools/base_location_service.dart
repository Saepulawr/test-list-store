import 'package:location/location.dart';

class BaseLocationService {
  BaseLocationService._();
  static Location location = Location();
  static bool serviceIsEnable = false;
  static PermissionStatus permissionStatus = PermissionStatus.denied;
  static Future<void> init() async {
    //enable service
    serviceIsEnable = await location.serviceEnabled();
    if (!serviceIsEnable) {
      serviceIsEnable = await location.requestService();
      if (!serviceIsEnable) {
        return;
      }
    }
  }

  static Future<bool> requestPermission() async {
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  static Future<LocationData?> getLocation() async {
    if (permissionStatus == PermissionStatus.granted) {
      return await location.getLocation();
    }
    return null;
  }
}
