import 'package:flutter_bloc_form_validation/models/user_model.dart';

class UserListState {
  final bool isLoading;
  final bool hasError;
  final List<UserModel> users;

  const UserListState({
    required this.users,
    required this.isLoading,
    required this.hasError,
  });

  UserListState copyWith({
    bool? isLoading,
    bool? hasError,
    List<UserModel>? users,
  }) =>
      UserListState(
        isLoading: isLoading ?? this.isLoading,
        hasError: hasError ?? this.hasError,
        users: users ?? this.users,
      );
}
