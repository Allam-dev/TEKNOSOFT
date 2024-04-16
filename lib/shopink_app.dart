import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/routing/app_router.dart';
import 'package:shopink/core/routing/routes.dart';

class ShopinkApp extends StatelessWidget {
  const ShopinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopink',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.loginRoute,
      onGenerateRoute: AppRouter().generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
    );
  }
}
