import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:enterprise_flutter/modules/auth/auth_api.dart';
import 'package:enterprise_flutter/modules/auth/views/auth_form_view.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _authApi = AuthApi();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: const AutoBackButton(),
      ),
      body: AuthFormView(
        submitText: 'Register',
        alternateText: 'Login',
        alternateLink: '/auth/login',
        onSubmitted: (value) async {
          try {
            await _authApi.login(value);
            context.router.navigateBack();
          } on DioError catch (_) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Register Failed'),
                  content:
                      const Text('Something went wrong, please try again.'),
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
        },
      ),
    );
  }
}
