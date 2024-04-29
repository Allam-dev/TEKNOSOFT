import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  const ErrorDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.error.tr()),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.ok.tr())),
      ],
    );
  }
}
