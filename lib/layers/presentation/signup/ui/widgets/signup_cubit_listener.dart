import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/extensions/context/showing.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/layers/presentation/signup/cubit/signup_cubit.dart';

class SignupCubitListener extends StatelessWidget {
  final Widget child;

  const SignupCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        switch (state) {
          case SignupError _:
            context.pop();
            context.showErrorDialog(message: state.message.tr());

          case SignupSuccess _:
            context.pushNamedAndRemoveUntil(Routes.mainLayoutRoute);
          case SignupLoading _:
            context.showLoadingDialog();
          default:
            break;
        }
      },
      child: child,
    );
  }
}
