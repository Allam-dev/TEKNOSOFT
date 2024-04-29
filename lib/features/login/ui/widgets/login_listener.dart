import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/ui/widgets/error_dialog.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';

class LoginCubitListener extends StatelessWidget {
  final Widget child;
  const LoginCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        switch (state) {
          case LoginError():
            context.pop();
            await showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                      message: state.message.tr(),
                    ));

          case LoginSuccess():
            context.pushNamedAndRemoveUntil(Routes.homeRoute);
          case LoginLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          default:
            break;
        }
      },
      child: child,
    );
  }
}
