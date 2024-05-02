import 'package:flutter/material.dart';
import 'package:shopink/features/home/ui/widgets/filtration_dialog.dart';

class FiltarButton extends StatelessWidget {
  const FiltarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context, builder: (context) => FiltrationDialog());
      },
      icon: const Icon(Icons.filter_alt),
    );
  }
}
