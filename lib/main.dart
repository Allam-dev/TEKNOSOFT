import 'package:flutter/material.dart';
import 'package:shopink/core/services/localization/localization_service.dart';
import 'package:shopink/shopink_app.dart';

part 'init.dart';

void main() async {
  await _initialization();

  runApp(LocalizationService.rootWidget(child: const ShopinkApp()));
}
