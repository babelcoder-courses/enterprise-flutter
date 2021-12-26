import 'package:enterprise_flutter/modules/auth/auth_api.dart';
import 'package:enterprise_flutter/modules/auth/models/profile.dart';
import 'package:enterprise_flutter/modules/shared/base_api.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthProvider extends ChangeNotifier {
  final _authApi = AuthApi();
  final _auth = Hive.box('auth');
  Profile? _profile;

  String? get token => _auth.get('token');

  Profile? get profile => _profile;

  bool get isAuthenticated => token != null;

  set profile(Profile? profile) {
    _profile = profile;
    notifyListeners();
  }

  Future<void> init() async {
    BaseApi.dio.options.headers['Authorization'] = 'Bearer $token';
    _profile = await _authApi.getProfile();
    notifyListeners();
  }

  setToken(String? token) async {
    _auth.put('token', token);
    await init();
    notifyListeners();
  }

  logout() {
    _auth.delete('token');
    BaseApi.dio.options.headers.remove('Authorization');
    _profile = null;
    notifyListeners();
  }
}
