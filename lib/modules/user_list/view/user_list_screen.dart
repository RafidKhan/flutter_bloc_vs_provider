import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/modules/user_list/provider/user_list_provider.dart';
import 'package:flutter_bloc_form_validation/modules/user_list/state/user_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListProvider =
    StateNotifierProvider<UserListProvider, UserListState>((ref) {
  return UserListProvider();
});

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, ref, child) {
        final state = ref.watch(userListProvider);
        final controller = ref.watch(userListProvider.notifier);
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
              });
        }

        if (state.users.isEmpty) {
          return const Center(
            child: Text("No Data Found"),
          );
        }

        return const SizedBox();
      }),
    );
  }
}
