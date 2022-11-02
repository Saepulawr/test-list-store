import 'package:pitjarus_test/base/apis/models/api_error.dart';

class ApiResult<T> {
  bool isError = false;
  final T? response;
  final ApiError? error;

  ApiResult({this.response, this.error}) {
    isError = error != null;
  }
}
