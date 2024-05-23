extension Validations on String {
  bool isEmail() {
    return RegExp(r'^[\w\-\.]+@[A-z0-9\-]+\.[A-z]{2,}$').hasMatch(this);
  }

  bool isPassword() {
    return RegExp(
            '^(?=(.*[a-z]){${PasswordValidationConditions.numberOfLowercase},})(?=(.*[A-Z]){${PasswordValidationConditions.numberOfUppercase},})(?=(.*[0-9]){${PasswordValidationConditions.numberOfDigits},})(?=(.*[!@#\$%^&*()\\-_+.]){${PasswordValidationConditions.numberOfSpecialCharacters},}).{${PasswordValidationConditions.minLength},}\$')
        .hasMatch(this);
  }

  bool isName() {
    if (isEmpty || length < 3) {
      return false;
    } else {
      return true;
    }
  }
}

abstract class PasswordValidationConditions {
  static const int minLength = 8;
  static const int numberOfDigits = 1;
  static const int numberOfSpecialCharacters = 1;
  static const int numberOfUppercase = 1;
  static const int numberOfLowercase = 1;
}
