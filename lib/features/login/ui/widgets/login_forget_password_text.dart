import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';

class LoginForgotPasswordText extends StatelessWidget {
  const LoginForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () => context.pushNamed(Routes.forgotPasswordRoute),
          child: Text(
            LocaleKeys.forgotPassword.tr(),
            style: TextStyles.font15BlueNormal,
          ),
        ),
      ],
    );
  }
}
