import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/modules/login/views/login_screen.dart';
import 'package:flutter_bloc_form_validation/modules/user_info_form/provider_scope/provider_scope.dart';
import 'package:flutter_bloc_form_validation/modules/user_list/provider_scope/provider_scope.dart';
import 'package:flutter_bloc_form_validation/modules/user_list_from_api/provider_scope/provider_scope.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserFormProviderScope(),
                  ),
                );
              },
              child: const Text("User Add"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListProviderScope(),
                  ),
                );
              },
              child: const Text("User List"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserListFromApiProviderScope(),
                  ),
                );
              },
              child: const Text("User List From Api"),
            ),
          ],
        ),
      ),
    );
  }
}
