import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/layers/presentation/splash/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Builder(builder: (context) {
        return BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoggedin) {
              context.pushReplacementNamed(Routes.mainLayoutRoute);
            } else if (state is SplashLoggedOut) {
              context.pushReplacementNamed(Routes.loginRoute);
            }
          },
          child: Builder(builder: (context) {
            context.read<SplashCubit>().checkLoginStatus();
            return const SafeArea(
                child: Center(
              child: CircularProgressIndicator.adaptive(),
            ));
          }),
        );
      }),
    );
  }
}
