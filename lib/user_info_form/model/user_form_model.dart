import 'package:flutter/material.dart';

@immutable
class UserFormModel {
  final String name;
  final String email;
  final String phone;
  final String address;
  final bool isValid;

  const UserFormModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.isValid,
  });

  UserFormModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
    bool? isValid,
  }) =>
      UserFormModel(
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        isValid: isValid ?? this.isValid,
      );

  factory UserFormModel.fromMap(Map<String, dynamic> json) => UserFormModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        isValid: json["isValid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "isValid": isValid,
      };
}
