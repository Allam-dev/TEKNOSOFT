import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/ui/widgets/or_divider.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';
import 'package:shopink/features/login/ui/widgets/login_button.dart';
import 'package:shopink/features/login/ui/widgets/login_dont_have_account.dart';
import 'package:shopink/features/login/ui/widgets/login_email_field.dart';
import 'package:shopink/features/login/ui/widgets/login_forget_password_text.dart';
import 'package:shopink/features/login/ui/widgets/login_listener.dart';
import 'package:shopink/features/login/ui/widgets/login_password_filed.dart';
import 'package:shopink/features/login/ui/widgets/login_with_google_button.dart';
import 'package:shopink/features/login/ui/widgets/welcome_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginCubitListener(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: context.read<LoginCubit>().formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginWelcomeText(),
                  Gap(50.h),
                  const LoginEmailFeild(),
                  Gap(20.h),
                  const LoginPasswordField(),
                  Gap(30.h),
                  const LoginForgotPasswordText(),
                  Gap(30.h),
                  const LoginButton(),
                  Gap(20.h),
                  const OrDivider(),
                  Gap(20.h),
                  const LoginWithGoogleButton(),
                  Gap(50.h),
                  const LoginDontHaveAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
