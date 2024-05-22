import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/core/ui/widgets/app_button.dart';
import 'package:shopink/layers/presentation/login/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      child: Text(
        LocaleKeys.singIn.tr(),
        style: TextStyles.font17BlackNormal,
      ),
      onPressed: () {
        context.read<LoginCubit>().loginWithEmailAndPassword();
      },
    );
  }
}
