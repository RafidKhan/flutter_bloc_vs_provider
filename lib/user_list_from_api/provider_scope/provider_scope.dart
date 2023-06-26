import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/user_list_from_api/view/user_list_from_api_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListFromApiProviderScope extends StatelessWidget {
  const UserListFromApiProviderScope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: UserListFromApiScreen(),
    );
  }
}
