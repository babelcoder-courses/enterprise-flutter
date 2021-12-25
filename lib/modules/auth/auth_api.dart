import 'package:enterprise_flutter/modules/shared/base_api.dart';

class AuthApi extends BaseApi {
  Future login(Map<String, dynamic> credentials) async {
    await api.post('/auth/sign-in', data: credentials);
  }

  Future register(Map<String, dynamic> credentials) async {
    await api.post('/auth/sign-up', data: credentials);
  }
}
