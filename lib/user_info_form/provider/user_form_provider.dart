import 'package:flutter_bloc_form_validation/user_info_form/model/user_form_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserFormProvider extends StateNotifier<UserFormModel> {
  UserFormProvider()
      : super(
          const UserFormModel(
            name: "",
            email: "",
            address: "",
            phone: "",
            isValid: false,
          ),
        );

  void updateForm({
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
    state = state.copyWith(
      name: name ?? state.name,
      email: email ?? state.email,
      phone: phone ?? state.phone,
      address: address ?? state.address,
    );
    isValid();
  }

  void isValid() {
    state = state.copyWith(
      isValid: (state.name.isNotEmpty &&
          state.email.isNotEmpty &&
          state.phone.isNotEmpty &&
          state.address.isNotEmpty),
    );
  }
}
