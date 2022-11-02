import 'package:get/get.dart';

class BaseEndpoint extends GetConnect {
  String baseurl() => "https://smartairport-api.hermatechs.id";

  //list of endpoint api

  //register firebase messaging token
  String get registerFcm => "${baseurl()}/v1/fcms";
  //notification list
  String get notificationListEndpoint => "${baseurl()}/v1/info";
  String get notificationMarkAsReadEndpoint => "${baseurl()}/v1/info/read";
  //base auth
  String get loginEndpoint => "${baseurl()}/v1/auth";
  String get registerEndpoint => "${baseurl()}/v1/auth/register";

  //merchant profile
  String get merchantProfileUploadImageEndpoint =>
      "${baseurl()}/v1/merchant/medias/file";
  String get merchantProfileEndpoint => "${baseurl()}/v1/merchants/profile";

  //taxi information
  String get taxiUploadImageEndpoint =>
      "${baseurl()}/v1/merchant/taxi/medias/file";
  String get taxigetProfileEndpoint => "${baseurl()}/v1/merchant/taxi";
  //taxi fare
  String get taxiFareEndpoint => "${baseurl()}/v1/merchant/taxi/fare";
  //taxi order
  String get taxiOrderEndpoint => "${baseurl()}/v1/merchant/taxi/order";
  String get taxiConfirmOrderEndpoint =>
      "${baseurl()}/v1/merchant/taxi/order/confirm";
  String get taxiCancelmOrderEndpoint =>
      "${baseurl()}/v1/merchant/taxi/order/cancel";

  //officer
  //user
  String get officerUsersEndpoint => "${baseurl()}/v1/admin/users";
  String get officerApproveUser => "${baseurl()}/v1/admin/users/approve";
  String get officerRejectUser => "${baseurl()}/v1/admin/users/reject";
  String get officerResetPasswordUser =>
      "${baseurl()}/v1/admin/users/reset-password";
  String get officerEnabledUser => "${baseurl()}/v1/admin/users/disabled/true";
  String get officerDisabledUser =>
      "${baseurl()}/v1/admin/users/disabled/false";
  //advertisement
  String get officerAdvertisementEndpoint =>
      "${baseurl()}/v1/officer/advertisements";
  String get officerUploadAdvertisementEndpoint =>
      "${baseurl()}/v1/officer/medias/file";
}
