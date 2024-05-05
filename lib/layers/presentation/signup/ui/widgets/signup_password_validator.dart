import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/extensions/string/validations.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/layers/presentation/signup/cubit/signup_cubit.dart';

class SignupPasswordValidator extends StatelessWidget {
  const SignupPasswordValidator({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterPwValidator(
      width: ScreenUtil().screenWidth,
      height: 150.h,
      minLength: PasswordValidationConditions.minLength,
      uppercaseCharCount: PasswordValidationConditions.numberOfUppercase,
      lowercaseCharCount: PasswordValidationConditions.numberOfLowercase,
      numericCharCount: PasswordValidationConditions.numberOfDigits,
      specialCharCount: PasswordValidationConditions.numberOfSpecialCharacters,
      strings: FlutterPwValidatorStringsWithTranslations(),
      onSuccess: () {},
      controller: context.read<SignupCubit>().passwordController,
    );
  }
}

class FlutterPwValidatorStringsWithTranslations
    implements FlutterPwValidatorStrings {
  @override
  String get atLeast => LocaleKeys.atLeast.tr();

  @override
  String get lowercaseLetters => LocaleKeys.lowercaseLetters.tr();

  @override
  String get normalLetters => LocaleKeys.normalLetters.tr();

  @override
  String get numericCharacters => LocaleKeys.numericCharacters.tr();

  @override
  String get specialCharacters => LocaleKeys.specialCharacters.tr();

  @override
  String get uppercaseLetters => LocaleKeys.uppercaseLetters.tr();
}
