import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<T?> pushReplacementNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  void popUntil(RoutePredicate predicate) =>
      Navigator.of(this).popUntil(predicate);

  void popAndPushNamed(String routeName, {Object? arguments}) =>
      Navigator.of(this).popAndPushNamed(routeName, arguments: arguments);

  void pushNamedAndRemoveUntil(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        routeName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );
}
