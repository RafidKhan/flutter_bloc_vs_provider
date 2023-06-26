import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validation/modules/login/bloc/my_form_bloc.dart';
import 'package:flutter_bloc_form_validation/modules/login/views/email_input.dart';
import 'package:flutter_bloc_form_validation/modules/login/views/password_input.dart';
import 'package:flutter_bloc_form_validation/modules/login/views/submit_button.dart';
import 'package:flutter_bloc_form_validation/modules/login/views/success_dialog.dart';
import 'package:formz/formz.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => MyFormBloc(),
        child: BlocListener<MyFormBloc, MyFormState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              showDialog<void>(
                context: context,
                builder: (_) => const SuccessDialog(),
              );
            }
            if (state.status.isInProgress) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Submitting...')),
                );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: const <Widget>[
                EmailInput(),
                PasswordInput(),
                SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
