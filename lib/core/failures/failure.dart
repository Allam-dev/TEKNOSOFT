import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:shopink/layers/data/source/remote/firebase/firebase_error_handler.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';

class Failure {
  final dynamic error;
  String _userMessage = '';
  Failure({this.error, String userMessage = ''}) {
    if (userMessage.isEmpty) {
      _userMessage = _errorMasseageMapper(error);
    } else {
      _userMessage = userMessage;
    }
  }

  String _errorMasseageMapper(dynamic error) {
    switch (error) {
      case FirebaseException _:
        return FirebaseExceptionHandler.handle(error);

      case SocketException _:
        return LocaleKeys.noInternetConnection;

      default:
        return LocaleKeys.somethingWrongHappend;
    }
  }

  String get message => _userMessage;
}
