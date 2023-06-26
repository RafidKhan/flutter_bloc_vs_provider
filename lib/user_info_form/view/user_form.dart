import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/user_info_form/model/user_form_model.dart';
import 'package:flutter_bloc_form_validation/user_info_form/provider/user_form_provider.dart';
import 'package:flutter_bloc_form_validation/user_info_form/view/user_form_submit_button.dart';
import 'package:flutter_bloc_form_validation/user_info_form/widgets/custom_textfield.dart';
import 'package:flutter_bloc_form_validation/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userFormProvider =
    StateNotifierProvider.autoDispose<UserFormProvider, UserFormModel>((ref) {
  return UserFormProvider();
});

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read(userFormProvider.notifier);
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hint: "Name",
                  onChanged: (value) {
                    controller.updateForm(name: value);
                  },
                ),
                CustomTextField(
                  hint: "Email",
                  onChanged: (value) {
                    controller.updateForm(email: value);
                  },
                ),
                CustomTextField(
                  hint: "Phone",
                  onChanged: (value) {
                    controller.updateForm(phone: value);
                  },
                ),
                CustomTextField(
                  hint: "Address",
                  onChanged: (value) {
                    controller.updateForm(address: value);
                  },
                ),
                Consumer(builder: (context, ref, child) {
                  final state = ref.watch(userFormProvider);
                  return UserFormSubmitButton(
                    isEnabled: state.isValid,
                    onTap: () {
                      print("TAP");
                    },
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
