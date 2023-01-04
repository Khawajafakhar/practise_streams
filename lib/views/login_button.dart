import 'package:flutter/material.dart';
import 'package:practise_bloc/dialogs/generic_dialog.dart';
import 'package:practise_bloc/strings.dart';

typedef OnLoginTap = void Function({
  required String email,
  required String password,
});

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLoginTap onLoginTap;
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final email = emailController.text;
        final password = passwordController.text;
        if (email.isEmpty || password.isEmpty) {
          showGenericDialog(
            context: context,
            title: emailOrPasswordEmptyDialogTitle,
            content: emailOrPasswordWmptyDescription,
            optionBuilder: () => {
              ok: true,
            },
          );
        } else {
          onLoginTap(
            email: email,
            password: password,
          );
        }
      },
      child: const Text(login),
    );
  }
}
