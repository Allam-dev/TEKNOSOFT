import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/ui/widgets/error_dialog.dart';
import 'package:shopink/layers/presentation/signup/cubit/signup_cubit.dart';

class SignupCubitListener extends StatelessWidget {
  final Widget child;

  const SignupCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) async {
        switch (state) {
          case SignupError():
            context.pop();
            await showDialog(
                context: context,
                builder: (context) => ErrorDialog(
                      message: state.message.tr(),
                    ));

          case SignupSuccess():
            context.pushNamedAndRemoveUntil(Routes.mainLayoutRoute);
          case SignupLoading():
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
