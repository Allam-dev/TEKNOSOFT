import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';

class LoginDontHaveAccountText extends StatelessWidget {
  const LoginDontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () => context.pushNamed(Routes.registerRoute),
          child: RichText(
            text: TextSpan(
              text: LocaleKeys.noAccount.tr(),
              style: TextStyles.font15GrayNormal,
              children: [
                TextSpan(
                  text: LocaleKeys.createOne.tr(),
                  style: TextStyles.font15BlueNormal.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
