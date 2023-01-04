import 'package:flutter/material.dart';
import 'package:practise_bloc/strings.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailTextField({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: enterYourEmailHere,
      ),
    );
  }
}
