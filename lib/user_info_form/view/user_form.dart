import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validation/models/user_form_model.dart';
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
    final state = context.read(userFormProvider);

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  label: "Name",
                  textEditingController: state.name,
                ),
                CustomTextField(
                  label: "Email",
                  textEditingController: state.email,
                ),
                Consumer(builder: (context, ref, child) {
                  final state = ref.watch(userFormProvider);
                  final controller = ref.read(userFormProvider.notifier);
                  return UserFormSubmitButton(
                    isEnabled: state.isValid,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      controller.performSubmit(context);
                    },
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
