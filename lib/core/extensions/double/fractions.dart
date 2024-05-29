import 'dart:math';

extension Fractions on double {
  double roundFractions(int digits) {
    double mod = pow(10.0, digits).toDouble();
    return ((this * mod).round().toDouble() / mod);
  }
}
