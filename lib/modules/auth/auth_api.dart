import 'package:dio/dio.dart';
import 'package:enterprise_flutter/modules/auth/models/profile.dart';
import 'package:enterprise_flutter/modules/shared/base_api.dart';

class AuthApi extends BaseApi {
  Future<String> login(Map<String, dynamic> credentials) async {
    final response = await api.post('/auth/sign-in', data: credentials);

    return response.data['token'];
  }

  Future register(Map<String, dynamic> credentials) async {
    await api.post('/auth/sign-up', data: credentials);
  }

  Future<Profile> getProfile() async {
    final response = await api.get('/auth/profile');

    return Profile.fromJson(response.data);
  }

  Future<Profile> updateProfile(Map<String, dynamic> data) async {
    final avatar = data['avatar'][0];
    final mapData = {
      'email': data['email'],
      'name': data['name'],
    };

    if (avatar is! String) {
      mapData['avatar'] = await MultipartFile.fromFile(
        avatar.path,
        filename: avatar.path.split('/').last,
      );
    }

    final formData = FormData.fromMap(mapData);
    final response = await api.patch('/auth/profile', data: formData);

    return Profile.fromJson(response.data);
  }
}
