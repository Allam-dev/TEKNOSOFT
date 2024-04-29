import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/assets/assets.gen.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/core/ui/widgets/fileds/app_button.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: (){
        context.read<LoginCubit>().loginWithGoogle();
      },
      color: ColorManager.lightGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.googleIc.image(height: 23.h),
        Gap(5.w),
        Text(
          LocaleKeys.signInWithGoogle.tr(),
          style: TextStyles.font17BlackNormal,
        ),
      ],
    ));
  }
}
