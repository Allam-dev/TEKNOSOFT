import 'package:shopink/layers/domain/entities/address.dart';
import 'package:shopink/layers/domain/entities/cart.dart';

class OrderEntity {
  final DateTime date;
  final AddressEntity address;
  final String email;
  final String phone;
  final CartEntity cart;

  OrderEntity({
    required this.date,
    required this.address,
    required this.email,
    required this.phone,
    required this.cart,
  });
}
