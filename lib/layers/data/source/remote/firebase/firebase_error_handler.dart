import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';

abstract interface class FirebaseExceptionHandler {
  static String handle(FirebaseException exception) {
    switch (exception.code) {
      case "wrong-password":
        return LocaleKeys.wrongPassword;
      case "user-not-found":
        return LocaleKeys.userNotFound;

      case "invalid-credential":
        return LocaleKeys.wrongEmailOrPassword;

      case "email-already-in-use":
        return LocaleKeys.emailAlreadyInUse;
      default:
        return LocaleKeys.somethingWrongHappend;
    }
  }
}
