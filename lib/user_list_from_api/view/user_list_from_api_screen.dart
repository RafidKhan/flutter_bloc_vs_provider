import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/user_list_from_api/provider/user_list_from_api_provider.dart';
import 'package:flutter_bloc_form_validation/user_list_from_api/state/user_list_from_api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListFromApiProvider =
    StateNotifierProvider<UserListFromApiProvider, UserListFromApiState>((ref) {
  return UserListFromApiProvider();
});

class UserListFromApiScreen extends StatelessWidget {
  const UserListFromApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(userListFromApiProvider);
          final controller = ref.watch(userListFromApiProvider.notifier);
          if (state.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.users.isNotEmpty) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    onPressed: () {
                      controller.removeUser(user);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          }

          if (state.users.isEmpty) {
            return const Center(
              child: Text("No Data Found"),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
