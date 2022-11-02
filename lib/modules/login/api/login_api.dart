import 'package:pitjarus_test/modules/store_list/model/store_list_model/store_list_model.dart';

import '../../../base/base.dart';

class LoginApi extends BaseApi {
  Future<ApiResult<StoreListModel?>> login({
    required String username,
    required String password,
  }) async {
    final response = await post<StoreListModel?>(
      url: endpoint.loginEndpoint,
      decoder: StoreListModel.fromJson,
    );
    return ApiResult(response: response.response?.body, error: response.error);
  }
}
