import 'dart:math';

extension Round on double {
  double roundFractions(int digits) {
    double mod = pow(10.0, digits).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}
