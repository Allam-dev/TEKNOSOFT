import 'package:shopink/layers/domain/entities/product.dart';

class CartEntity {
  double totalPrice;
  int totalItems;
  List<ProductEntity> products;

  CartEntity(
      {required this.totalPrice,
      required this.totalItems,
      required this.products});
}
