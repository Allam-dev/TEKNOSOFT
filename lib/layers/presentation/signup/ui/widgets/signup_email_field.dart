import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/string/validations.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/signup/cubit/signup_cubit.dart';

class SignupEmailField extends StatelessWidget {
  const SignupEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) => value!.isEmail() ? null : LocaleKeys.invalid.tr(),
      decoration: InputDecoration(
        hintText: LocaleKeys.email.tr(),
      ),
    );
  }
}