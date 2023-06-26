import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;
  final TextEditingController? textEditingController;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.onChanged,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
