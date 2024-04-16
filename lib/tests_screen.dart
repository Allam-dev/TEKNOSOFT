import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/services/localization/locales.dart';

// this screen to test packges and plugin and some crazy ideas

class TestsScreen extends StatelessWidget {
  const TestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tests Screen'),
      ),
      body:  Column(
        children: [
          Text(LocaleKeys.hi.tr(args: ['bode'])),
          TextButton(onPressed: () => context.setLocale(Locales.english), child: const Text('English')),
          TextButton(onPressed: () => context.setLocale(Locales.arabic), child: const Text('العربية')),
        ],
      ),
    );
  }
}