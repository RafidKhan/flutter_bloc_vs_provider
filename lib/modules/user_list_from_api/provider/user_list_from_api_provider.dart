import 'package:dio/dio.dart';
import 'package:flutter_bloc_form_validation/models/user_model.dart';
import 'package:flutter_bloc_form_validation/modules/user_list_from_api/state/user_list_from_api_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserListFromApiProvider extends StateNotifier<UserListFromApiState> {
  UserListFromApiProvider()
      : super(const UserListFromApiState(
          users: [],
          isLoading: false,
          hasError: false,
        )) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      state = state.copyWith(
        isLoading: true,
      );
      final Dio dio = Dio();

      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      final List users = response.data;
      final List<UserModel> userList = [];
      users.forEach((element) {
        userList.add(
          UserModel(
            name: element['name'],
            email: element['email'],
          ),
        );
      });

      state = state.copyWith(
        users: userList,
        isLoading: false,
        hasError: false,
      );
    } catch (e) {
      state = state.copyWith(
        users: [],
        isLoading: false,
        hasError: true,
      );
    }
  }

  removeUser(UserModel model) {
    final users = state.users;
    users.removeWhere((element) => element.name == model.name);
    state = state.copyWith(
      users: users,
    );
  }
}
