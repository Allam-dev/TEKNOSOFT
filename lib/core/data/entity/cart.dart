import 'package:shopink/core/data/entity/product.dart';

class CartEntity {
  int totalPrice;
  int totalItems;
  List<ProductEntity> products;

  CartEntity(
      {required this.totalPrice,
      required this.totalItems,
      required this.products});
}
