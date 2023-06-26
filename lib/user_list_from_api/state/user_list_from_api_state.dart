import 'package:flutter_bloc_form_validation/user_list/model/user_model.dart';

class UserListFromApiState {
  final bool isLoading;
  final bool hasError;
  final List<UserModel> users;

  const UserListFromApiState({
    required this.users,
    required this.isLoading,
    required this.hasError,
  });

  UserListFromApiState copyWith({
    bool? isLoading,
    bool? hasError,
    List<UserModel>? users,
  }) =>
      UserListFromApiState(
        isLoading: isLoading ?? this.isLoading,
        hasError: hasError ?? this.hasError,
        users: users ?? this.users,
      );
}
