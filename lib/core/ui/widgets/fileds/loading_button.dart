import 'package:flutter/material.dart';
import 'package:shopink/core/ui/widgets/fileds/app_button.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppButton(child: CircularProgressIndicator.adaptive());
  }
}
