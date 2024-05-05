import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:shopink/layers/data/source/remote/firebase/firebase_error_handler.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';

class Failure {
  final dynamic error;
  String _userMessage = '';
  Failure({this.error, String userMessage = ''}) {
    if (userMessage.isEmpty) {
      _userMessage = _exceptionMasseageMapper(error);
    } else {
      _userMessage = userMessage;
    }
  }

  String _exceptionMasseageMapper(dynamic exception) {
    if (exception is FirebaseException) {
      return FirebaseExceptionHandler.handle(exception);
    } else if (exception is SocketException) {
      return LocaleKeys.noInternetConnection;
    } else {
      return LocaleKeys.somethingWrongHappend;
    }
  }

  String get message => _userMessage;
}
