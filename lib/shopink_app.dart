import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/routing/app_router.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/ui/assets/assets.gen.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';

class ShopinkApp extends StatelessWidget {
  const ShopinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Shopink',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: Routes.splashRoute,
          onGenerateRoute: AppRouter().generateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorSchemeSeed: ColorManager.yellow,
            fontFamily: Assets.fonts.cairoRegular,
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: ColorManager.yellow),
            appBarTheme:
                const AppBarTheme(centerTitle: true, color: Colors.white),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: ColorManager.lightGrey,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorManager.lightGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorManager.lightGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorManager.lightGrey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorManager.lightGrey),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorManager.lightGrey),
              ),
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
