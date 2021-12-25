import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:auto_route/auto_route.dart';

class AuthFormView extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final String alternateText;
  final String alternateLink;
  final String submitText;
  final Function(Map<String, dynamic>) onSubmitted;

  AuthFormView({
    Key? key,
    required this.submitText,
    required this.alternateText,
    required this.alternateLink,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/no-avatar.png',
          width: 150,
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.email(context),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'password',
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                  obscureText: true,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 8),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(submitText),
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        onSubmitted(_formKey.currentState!.value);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () =>
                        context.router.navigateNamed(alternateLink),
                    child: Text(alternateText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
