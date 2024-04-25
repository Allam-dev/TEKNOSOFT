import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/routing/app_router.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';
import 'package:shopink/core/ui/theming/font_families.dart';

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
            fontFamily: FontFamilies.cairo,
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: ColorManager.yellow),
            appBarTheme:
                const AppBarTheme(centerTitle: true, color: Colors.white),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey.shade100,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
