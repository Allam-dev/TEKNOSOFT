import 'package:flutter/material.dart';

class ShopinkApp extends StatelessWidget {
  const ShopinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopink',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const Placeholder(),
    );
  }
}
