import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/widgets/or_divider.dart';
import 'package:shopink/features/signup/logic/cubit/signup_cubit.dart';
import 'package:shopink/features/signup/ui/widgets/signup_button.dart';
import 'package:shopink/features/signup/ui/widgets/signup_cubit_listener.dart';
import 'package:shopink/features/signup/ui/widgets/signup_email_field.dart';
import 'package:shopink/features/signup/ui/widgets/signup_name_field.dart';
import 'package:shopink/features/signup/ui/widgets/signup_password_filed.dart';
import 'package:shopink/features/signup/ui/widgets/signup_password_validator.dart';
import 'package:shopink/features/signup/ui/widgets/signup_with_google_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupCubit>(),
      child: Builder(
        builder: (context) {
          return SignupCubitListener(
            child: Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.signUp.tr()),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Form(
                    key: context.read<SignupCubit>().formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SignupNameField(),
                        Gap(20.h),
                        const SignupEmailField(),
                        Gap(20.h),
                        const SignupPasswordField(),
                        Gap(30.h),
                        const SignupPasswordValidator(),
                        Gap(30.h),
                        const SignupButton(),
                        Gap(20.h),
                        const OrDivider(),
                        Gap(20.h),
                        const SignupWithGoogleButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
