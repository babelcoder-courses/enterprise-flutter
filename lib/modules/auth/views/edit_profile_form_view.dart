import 'package:enterprise_flutter/modules/auth/auth_api.dart';
import 'package:enterprise_flutter/modules/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class EditProfileForm extends StatelessWidget {
  final _authApi = AuthApi();
  final _formKey = GlobalKey<FormBuilderState>();

  EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<AuthProvider>().profile!;

    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: SizedBox(
        child: Column(
          children: [
            FormBuilderImagePicker(
              initialValue: [profile.avatar],
              name: 'avatar',
              decoration: const InputDecoration(
                labelText: 'Pick Avatar',
              ),
              maxImages: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              name: 'email',
              initialValue: profile.email,
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
              name: 'name',
              initialValue: profile.name,
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.text_fields),
              ),
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(context),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Edit Profile'),
                onPressed: () async {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    final value = _formKey.currentState!.value;
                    final profile = await _authApi.updateProfile(value);
                    context.read<AuthProvider>().profile = profile;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
