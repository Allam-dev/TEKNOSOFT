import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';

sealed class FirebaseErrorHandler {
  static String handle(FirebaseException exception) {
    switch (exception.code) {
      case "wrong-password":
        return LocaleKeys.wrongPassword.tr();
      case "user-not-found":
        return LocaleKeys.userNotFound.tr();

      case "email-already-in-use":
        return LocaleKeys.emailAlreadyInUse.tr();
      default:
        return LocaleKeys.somethingWrongHappend.tr();
    }
  }
}
