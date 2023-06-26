import 'package:flutter/material.dart';

@immutable
class UserFormModel {
  final TextEditingController name;
  final TextEditingController email;
  final bool isValid;

  const UserFormModel({
    required this.name,
    required this.email,
    required this.isValid,
  });

  UserFormModel copyWith({
    TextEditingController? name,
    TextEditingController? email,
    bool? isValid,
  }) =>
      UserFormModel(
        name: name ?? this.name,
        email: email ?? this.email,
        isValid: isValid ?? this.isValid,
      );
}
