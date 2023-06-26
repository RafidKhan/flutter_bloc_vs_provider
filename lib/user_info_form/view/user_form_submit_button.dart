import 'package:flutter/material.dart';

class UserFormSubmitButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onTap;

  const UserFormSubmitButton({
    Key? key,
    required this.isEnabled,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: isEnabled ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Submit",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
