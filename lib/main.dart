import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/core/services/localization/localization_service.dart';
import 'package:shopink/shopink_app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

part 'init.dart';

void main() async {
  await _initialization();

  runApp(LocalizationService.rootWidget(child: const ShopinkApp()));
}
