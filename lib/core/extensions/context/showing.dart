import 'package:flutter/material.dart';
import 'package:shopink/core/ui/widgets/error_dialog.dart';

extension Showing on BuildContext {
  void showSnackBar({required SnackBar snackBar}) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showErrorDialog({required String message}) {
    showDialog(
      context: this,
      builder: (context) {
        return ErrorDialog(message: message);
      },
    );
  }

  void showLoadingDialog() {
    showDialog(
      context: this,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
