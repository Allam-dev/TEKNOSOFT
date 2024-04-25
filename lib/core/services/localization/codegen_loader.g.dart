// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "somethingWrongHappend": "حدث خطأ ما",
  "ok": "موافق",
  "cancel": "إلغاء",
  "error": "خطأ",
  "success": "نجاح",
  "warning": "تحذير",
  "emailAlreadyInUse": "هذا البريد الإلكتروني مستخدم من قبل",
  "userNotFound": "المستخدم غير موجود",
  "wrongPassword": "كلمة المرور خاطئة",
  "welcome": "مرحباً",
  "signInToContinue": "تسجيل الدخول للمتابعة",
  "signUp": "تسجيل",
  "singIn": "تسجيل الدخول",
  "or": "أو",
  "forgotPassword": "نسيت كلمة المرور؟",
  "email": "البريد الإلكتروني",
  "password": "كلمة المرور",
  "confirmPassword": "تأكيد كلمة المرور",
  "name": "الاسم",
  "phone": "رقم الهاتف"
};
static const Map<String,dynamic> en = {
  "somethingWrongHappend": "Something wrong happened",
  "ok": "OK",
  "cancel": "Cancel",
  "error": "Error",
  "success": "Success",
  "warning": "Warning",
  "emailAlreadyInUse": "The account already exists for that email",
  "userNotFound": "User not found",
  "wrongPassword": "Wrong password",
  "welcome": "Welcome",
  "signInToContinue": "Sign in to continue",
  "signUp": "Sign up",
  "singIn": "Sign in",
  "or": "or",
  "forgotPassword": "Forgot password?",
  "email": "Email",
  "password": "Password",
  "confirmPassword": "Confirm password",
  "name": "Name",
  "phone": "Phone"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
