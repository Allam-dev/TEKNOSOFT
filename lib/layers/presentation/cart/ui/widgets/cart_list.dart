import 'package:flutter/widgets.dart';
import 'package:shopink/layers/domain/entities/cart.dart';
import 'package:shopink/layers/presentation/cart/ui/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  final List<CartProductEntity> products;
  const CartList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => CartItem(product: products[index]),
    );
  }
}
