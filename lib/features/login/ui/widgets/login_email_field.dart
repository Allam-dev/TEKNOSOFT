import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/string/validations.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';

class LoginEmailFeild extends StatelessWidget {
  const LoginEmailFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginCubit>().emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) => value!.isEmail() ? null : LocaleKeys.invalid.tr(),
      decoration: InputDecoration(
        hintText: LocaleKeys.email.tr(),
      ),
    );
  }
}
