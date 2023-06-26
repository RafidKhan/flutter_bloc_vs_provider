import 'package:flutter_bloc_form_validation/database/database.dart';
import 'package:flutter_bloc_form_validation/user_list/model/user_model.dart';
import 'package:flutter_bloc_form_validation/user_list/state/user_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListProvider extends StateNotifier<UserListState> {
  UserListProvider()
      : super(const UserListState(
          users: [],
          isLoading: true,
          hasError: false,
        )) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      users: listUsers,
      isLoading: false,
      hasError: false,
    );
  }

  removeUser(UserModel model) {
    final users = state.users;
    users.removeWhere((element) => element.name == model.name);
    state = state.copyWith(
      users: users,
    );
  }
}
