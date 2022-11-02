import 'dart:convert';

import 'package:get/get.dart';
import 'package:pitjarus_test/base/apis/base_endpoint.dart';
import 'package:pitjarus_test/base/apis/models/api_error.dart';
import 'package:pitjarus_test/base/apis/models/api_result.dart';

class BaseApi {
  final BaseEndpoint endpoint = BaseEndpoint();
  final GetConnect requestHandler =
      GetConnect(timeout: const Duration(seconds: 30));
  late bool enableAuthHeader;
  BaseApi() {
    onInit();
  }
  void onInit() {
    enableAuthHeader = true;
  }

  Map<String, String> _handlingHeader({
    required Map<String, String>? userHeader,
  }) {
    return userHeader ?? {};
    // if (userHeader == null) {
    //   return BaseAuthController.instance.authHeader;
    // } else {
    //   if (userHeader.keys
    //       .firstWhere(
    //           (element) =>
    //               element.toLowerCase() ==
    //               BaseAuthController.instance.authHeader.keys.first
    //                   .toLowerCase(),
    //           orElse: () => "")
    //       .isEmpty) {
    //     return BaseAuthController.instance.authHeader..addAll(userHeader);
    //   } else {
    //     return userHeader;
    //   }
    // }
  }

  void printLog({
    String? method,
    String? url,
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? data,
    Response? response,
  }) {
    String? responseBody;
    try {
      responseBody = (jsonEncode(response?.body ?? {}));
    } catch (e) {
      responseBody = response?.body.toString();
    }
    final src = {
      "Method": method,
      "Url": url,
      "Headers": (headers ?? {}),
      "Params": (params ?? {}),
      "Data": (data ?? {}),
      "Response Code": response?.statusCode,
      "Response Status": response?.statusText,
      "Response Body": responseBody,
    };
    printInfo(info: "\n${_prettyJson(src)}");
  }

  String _prettyJson(dynamic json) {
    var spaces = ' ' * 4;
    var encoder = JsonEncoder.withIndent(spaces);
    return encoder.convert(json);
  }

  Future<ApiResult<Response<T>>> get<T>({
    required String url,
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? params,
  }) async {
    final thisHeader =
        enableAuthHeader ? _handlingHeader(userHeader: headers) : headers;
    final response = await requestHandler.get(url,
        query: params, headers: thisHeader, decoder: decoder);
    printLog(
        method: "GET",
        url: url,
        params: params,
        headers: thisHeader,
        response: response);
    if (response.hasError) {
      // //auto refresh token
      // if (response.statusCode == 401 &&
      //     BaseAuthController.instance.isLoggedin) {
      //   final res = await BaseAuthController.instance
      //       .refreshToken(autoDirectToLoginPage: true);
      //   if (res) {
      //     return await get(
      //         url: url,
      //         params: params,
      //         headers: _handlingHeader(userHeader: headers),
      //         decoder: decoder);
      //   }
      // }
      return ApiResult(
          response: response,
          error: ApiError<Response<T>>(
            code: response.statusCode.toString(),
            description: response.statusText,
            data: response,
          ));
    } else {
      return ApiResult(response: response);
    }
  }

  Future<ApiResult<Response<T>>> post<T>({
    required String url,
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? data,
  }) async {
    final thisHeader =
        enableAuthHeader ? _handlingHeader(userHeader: headers) : headers;
    final response = await requestHandler.post(
      url,
      data,
      query: params,
      headers: thisHeader,
      decoder: decoder,
    );
    printLog(
        method: "POST",
        url: url,
        params: params,
        headers: thisHeader,
        data: data,
        response: response);
    if (response.hasError) {
      // //auto refresh token
      // if (response.statusCode == 401 &&
      //     BaseAuthController.instance.isLoggedin) {
      //   final res = await BaseAuthController.instance
      //       .refreshToken(autoDirectToLoginPage: true);
      //   if (res) {
      //     return await post(
      //         url: url,
      //         params: params,
      //         headers: _handlingHeader(userHeader: headers),
      //         decoder: decoder,
      //         data: data);
      //   }
      // }
      return ApiResult(
          response: response,
          error: ApiError<Response<T>>(
            code: response.statusCode.toString(),
            description: response.statusText,
            data: response,
          ));
    } else {
      return ApiResult(response: response);
    }
  }

  Future<ApiResult<Response<T>>> put<T>({
    required String url,
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? data,
  }) async {
    final thisHeader =
        enableAuthHeader ? _handlingHeader(userHeader: headers) : headers;
    final response = await requestHandler.put(url, data,
        query: params,
        headers: thisHeader,
        decoder: decoder,
        contentType: "application/json");
    printLog(
        method: "PUT",
        url: url,
        params: params,
        headers: thisHeader,
        data: data,
        response: response);
    if (response.hasError) {
      // //auto refresh token
      // if (response.statusCode == 401 &&
      //     BaseAuthController.instance.isLoggedin) {
      //   final res = await BaseAuthController.instance
      //       .refreshToken(autoDirectToLoginPage: true);
      //   if (res) {
      //     return await get(
      //       url: url,
      //       params: params,
      //       headers: _handlingHeader(userHeader: headers),
      //       decoder: decoder,
      //     );
      //   }
      // }
      return ApiResult(
          response: response,
          error: ApiError<Response<T>>(
            code: response.statusCode.toString(),
            description: response.statusText,
            data: response,
          ));
    } else {
      return ApiResult(response: response);
    }
  }

  Future<ApiResult<Response<T>>> upload<T>({
    required String url,
    T Function(dynamic)? decoder,
    Map<String, String>? headers,
    Map<String, String>? params,
    required FormData data,
    void Function(double percent)? uploadProgress,
  }) async {
    final thisHeader =
        enableAuthHeader ? _handlingHeader(userHeader: headers) : headers;
    final response = await GetConnect(timeout: 3.minutes).post(
      url,
      data,
      query: params,
      headers: thisHeader,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
    printLog(
        method: "POST UPLOAD",
        url: url,
        params: params,
        headers: thisHeader,
        data: {"fields": data.fields},
        response: response);
    if (response.hasError) {
      return ApiResult(
          response: response,
          error: ApiError<Response<T>>(
            code: response.statusCode.toString(),
            description: response.statusText,
            data: response,
          ));
    } else {
      return ApiResult(response: response);
    }
  }
}
