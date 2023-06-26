import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/user_info_form/view/user_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserFormProviderScope extends StatelessWidget {
  const UserFormProviderScope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: UserForm());
  }
}
