import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_form_validation/database/database.dart';
import 'package:flutter_bloc_form_validation/user_info_form/model/user_form_model.dart';
import 'package:flutter_bloc_form_validation/user_list/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserFormProvider extends StateNotifier<UserFormModel> {
  UserFormProvider()
      : super(
          UserFormModel(
            name: TextEditingController(),
            email: TextEditingController(),
            isValid: false,
          ),
        ) {
    state.name.addListener(() {
      isValid();
    });
    state.email.addListener(() {
      isValid();
    });
  }

  void isValid() {
    state = state.copyWith(
      isValid: (state.name.text.isNotEmpty && state.email.text.isNotEmpty),
    );
  }

  void performSubmit(BuildContext context) {
    addUser(
      UserModel(
        name: state.name.text,
        email: state.email.text,
      ),
    );
    Navigator.pop(context);
  }
}
