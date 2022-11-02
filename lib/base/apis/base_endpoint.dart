import 'package:get/get.dart';

class BaseEndpoint extends GetConnect {
  String baseurl() => "http://dev.pitjarus.co";

  //list of endpoint api

  String get loginEndpoint =>
      "${baseurl()}/api/sariroti_md/index.php/login/loginTest";
}
