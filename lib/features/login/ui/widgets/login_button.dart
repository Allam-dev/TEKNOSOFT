import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/widgets/fileds/app_button.dart';
import 'package:shopink/core/ui/widgets/fileds/loading_button.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const LoadingButton();
        } else {
          return AppButton(
            child: Text(LocaleKeys.singIn.tr()),
            onPressed: () {
              context.read<LoginCubit>().loginWithEmailAndPassword();
            },
          );
        }
      },
    );
  }
}
