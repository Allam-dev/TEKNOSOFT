extension Validations on String {
  bool isEmail() {
    return RegExp(r'^[\w\-\.]+@[A-z0-9\-]+\.[A-z]{2,}$').hasMatch(this);
  }

  bool isPassword({
    int minLength = 8,
    int numberOfDigits = 1,
    int numberOfSpecialCharacters = 1,
    int numberOfUppercase = 1,
    int numberOfLowercase = 1,
  }) {
    return RegExp(
            '^(?=(.*[a-z]){$numberOfLowercase,})(?=(.*[A-Z]){$numberOfUppercase,})(?=(.*[0-9]){$numberOfDigits,})(?=(.*[!@#\$%^&*()\\-_+.]){$numberOfSpecialCharacters,}).{$minLength,}\$')
        .hasMatch(this);
  }
}
