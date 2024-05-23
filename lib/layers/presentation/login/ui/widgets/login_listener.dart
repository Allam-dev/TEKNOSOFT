import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/extensions/context/showing.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/layers/presentation/login/cubit/login_cubit.dart';

class LoginCubitListener extends StatelessWidget {
  final Widget child;
  const LoginCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginError _:
            context.pop();
            context.showErrorDialog(message: state.message.tr());

          case LoginSuccess _:
            context.pushNamedAndRemoveUntil(Routes.mainLayoutRoute);
          case LoginLoading _:
            context.showLoadingDialog();
          default:
            break;
        }
      },
      child: child,
    );
  }
}
