import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.textEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: label,
          ),
          validator: validator,
          onChanged: (value) {
            formKey.currentState?.validate();
          },
        ),
      ),
    );
  }
}
