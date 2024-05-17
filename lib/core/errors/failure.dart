import 'package:shopink/core/services/localization/locale_keys.g.dart';

class Failure {
  final FailureType type;
  String _message = '';

  Failure({required this.type, String message = ''}) {
    if (message.isEmpty) {
      _message = _failureMasseageMapper(type);
    }
    _message = message;
  }

  factory Failure.fromException(
      {required dynamic exception, String message = ''}) {
    FailureType type;
    switch (exception.runtimeType) {
      default:
        type = FailureType.unknown;
    }

    return Failure(type: type, message: message);
  }

  String _failureMasseageMapper(FailureType type) {
    switch (type) {
      case FailureType.noInternet:
        return LocaleKeys.checkInternetConnection;
      case FailureType.unknown:
        return LocaleKeys.somethingWrongHappend;
      case FailureType.unauthorized:
        return LocaleKeys.unauthorized;
      case FailureType.invalidInput:
        return LocaleKeys.invalidInput;
    }
  }

  String get message => _message;
}

enum FailureType {
  noInternet,
  unknown,
  unauthorized,
  invalidInput,
}
