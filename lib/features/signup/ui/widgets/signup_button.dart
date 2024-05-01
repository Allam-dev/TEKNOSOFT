import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/core/ui/widgets/fileds/app_button.dart';
import 'package:shopink/features/signup/logic/cubit/signup_cubit.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      child: Text(
        LocaleKeys.signUp.tr(),
        style: TextStyles.font17BlackNormal,
      ),
      onPressed: () {
        context.read<SignupCubit>().signupWithEmailAndPassword();
      },
    );
  }
}
