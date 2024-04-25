import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/features/login/logic/cubit/login_cubit.dart';
import 'package:shopink/features/login/ui/widgets/login_button.dart';
import 'package:shopink/features/login/ui/widgets/welcome_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: context.read<LoginCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginWelcomeText(),
                Gap(50.h),
                TextFormField(
                    controller: context.read<LoginCubit>().emailController),
                Gap(20.h),
                TextFormField(
                    controller: context.read<LoginCubit>().passwordController),
                Gap(20.h),
                const LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
