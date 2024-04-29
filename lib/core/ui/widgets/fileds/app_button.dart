import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final Widget child;
  const AppButton(
      {super.key,
      this.onPressed,
      required this.child,
      this.color = ColorManager.yellow});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
