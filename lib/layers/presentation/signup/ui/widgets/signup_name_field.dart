import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/signup/cubit/signup_cubit.dart';

class SignupNameField extends StatelessWidget {
  const SignupNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<SignupCubit>().nameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 3) {
          return LocaleKeys.invalid.tr();
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.name.tr(),
      ),
    );
  }
}
