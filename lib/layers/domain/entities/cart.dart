import 'package:shopink/layers/domain/entities/product.dart';

class CartEntity {
  int totalPrice;
  int totalItems;
  List<CartProductEntity> products;

  CartEntity(
      {required this.totalPrice,
      required this.totalItems,
      required this.products});
}

// ignore: must_be_immutable
class CartProductEntity extends ProductEntity {
  int quantity;
   CartProductEntity({required this.quantity, required super.id, required super.name, required super.description, required super.imageUrl, required super.price, required super.category, required super.rate});
}
