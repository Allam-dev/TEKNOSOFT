import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:shopink/core/services/localization/locales.dart';

import 'codegen_loader.g.dart';

sealed class LocalizationService {
  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
  }

  static Widget rootWidget({required Widget child}) {
    return EasyLocalization(
      saveLocale: true,
      supportedLocales: const [Locales.english, Locales.arabic],
      path: 'lib/core/services/localization/translations',
      fallbackLocale: Locales.english,
      assetLoader: const CodegenLoader(),
      child: child,
    );
  }
}
