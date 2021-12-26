import 'package:enterprise_flutter/modules/articles/models/article_item.dart';
import 'package:enterprise_flutter/modules/categories/category_api.dart';
import 'package:enterprise_flutter/modules/categories/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ArticleFormView extends StatelessWidget {
  final String submitText;
  final Function(Map<String, dynamic>) onSubmitted;
  final ArticleItem? initialValues;
  final _categoryApi = CategoryApi();

  ArticleFormView({
    Key? key,
    required this.submitText,
    required this.onSubmitted,
    this.initialValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormBuilderImagePicker(
                    name: 'image',
                    initialValue:
                        initialValues == null ? [] : [initialValues?.image],
                    decoration: const InputDecoration(labelText: 'Pick Image'),
                    maxImages: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: 'title',
                    initialValue: initialValues?.title,
                    decoration: const InputDecoration(
                      labelText: 'Title',
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
                  FutureBuilder<List<Category>>(
                    future: _categoryApi.getCategoryList(),
                    builder: (context, snapshot) {
                      return FormBuilderDropdown(
                        name: 'categoryId',
                        initialValue: initialValues?.categoryId,
                        decoration: const InputDecoration(
                          labelText: 'Category',
                        ),
                        allowClear: true,
                        hint: const Text('Select Category'),
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(context),
                          ],
                        ),
                        items: snapshot.hasData
                            ? snapshot.data!
                                .map(
                                  (category) => DropdownMenuItem(
                                    value: category.id,
                                    child: Text(category.name),
                                  ),
                                )
                                .toList()
                            : [],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: 'excerpt',
                    initialValue: initialValues?.excerpt,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Excerpt',
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
                  FormBuilderTextField(
                    name: 'body',
                    initialValue: initialValues?.body,
                    minLines: 5,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      labelText: 'Body',
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
                      child: Text(submitText),
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          onSubmitted(_formKey.currentState!.value);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
