import 'package:pitjarus_test/modules/list_store/model/list_store_model/list_store_model.dart';

import '../../../base/base.dart';

class LoginApi extends BaseApi {
  Future<ApiResult<ListStoreModel?>> login({
    required String username,
    required String password,
  }) async {
    final response = await post<ListStoreModel?>(
      url: endpoint.loginEndpoint,
      sendAsFormData: true,
      data: {
        "username": username,
        "password": password,
      },
      decoder: ListStoreModel.fromJson,
    );
    return ApiResult(response: response.response?.body, error: response.error);
  }
}
