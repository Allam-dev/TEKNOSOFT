import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShopinkApp extends StatelessWidget {
  const ShopinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopink',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const Placeholder(),
    );
  }
}
