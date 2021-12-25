import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:enterprise_flutter/modules/auth/auth_api.dart';
import 'package:enterprise_flutter/modules/auth/views/auth_form_view.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _authApi = AuthApi();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: const AutoBackButton(),
      ),
      body: AuthFormView(
        submitText: 'Login',
        alternateText: 'Register',
        alternateLink: '/auth/register',
        onSubmitted: (value) async {
          try {
            await _authApi.login(value);
            context.router.navigateBack();
          } on DioError catch (e) {
            if (e.response != null && e.response!.statusCode == 401) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Login Failed'),
                    content: const Text('Invalid username or password.'),
                    actions: [
                      TextButton(
                        onPressed: () => context.router.pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
