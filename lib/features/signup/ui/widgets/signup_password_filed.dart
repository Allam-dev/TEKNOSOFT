import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/string/validations.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/features/signup/logic/cubit/signup_cubit.dart';

class SignupPasswordField extends StatefulWidget {
  const SignupPasswordField({super.key});

  @override
  State<SignupPasswordField> createState() => _SignupPasswordFieldState();
}

class _SignupPasswordFieldState extends State<SignupPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      validator: (value) =>
          value!.isPassword() ? null : LocaleKeys.invalid.tr(),
      decoration: InputDecoration(
        hintText: LocaleKeys.password.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }
}
