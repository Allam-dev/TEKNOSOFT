import 'package:flutter/material.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const AppButton({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          ColorManager.yellow,
        ),
      ),
      child: child,
    );
  }
}
