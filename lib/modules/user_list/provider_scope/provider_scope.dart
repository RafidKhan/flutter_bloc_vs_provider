import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/modules/user_list/view/user_list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListProviderScope extends StatelessWidget {
  const UserListProviderScope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: UserListScreen(),
    );
  }
}
