import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/string/validations.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({super.key});

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginCubit>().passwordController,
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
