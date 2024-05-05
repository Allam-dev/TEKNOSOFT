import 'package:shopink/layers/domain/entities/address.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String imageUrl;
  final String phone;
  final AddressEntity address;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.phone,
    required this.address,
  });
}
