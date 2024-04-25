extension Validations on String {
  bool isEmail() {
    return RegExp(r'^([a-zA-Z0-9\._\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z]{2,})$')
        .hasMatch(this);
  }

  bool isPassword() {
    return RegExp(
            r'^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[0-9]){1,})(?=(.*[!@#$%^&*()\-_+.]){1,}).{8,}$')
        .hasMatch(this);
  }
}
