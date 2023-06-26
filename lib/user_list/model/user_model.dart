import 'package:flutter/material.dart';

@immutable
class UserModel {
  final String name;
  final String email;

  const UserModel({
    required this.name,
    required this.email,
  });

  UserModel copyWith({
    String? name,
    String? email,
  }) =>
      UserModel(
        name: name ?? this.name,
        email: email ?? this.email,
      );
}
