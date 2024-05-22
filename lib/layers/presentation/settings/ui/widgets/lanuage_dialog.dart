import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/extensions/locale/language_name.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final locales = context.supportedLocales;
    return Dialog(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        shrinkWrap: true,
        itemCount: locales.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(locales[index].name),
              onTap: () {
                context.setLocale(locales[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
