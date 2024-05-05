import 'package:flutter/material.dart';
import 'package:shopink/core/ui/widgets/app_network_image.dart';
import 'package:shopink/layers/domain/entities/cart.dart';

class CartItem extends StatelessWidget {
  final CartProductEntity product;
  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {},
      key: Key(product.id.toString()),
      child: Card(
        child: Row(
          children: [
            Expanded(flex: 1, child: AppNetworkImage(src: product.imageUrl)),
            Expanded(
              flex: 5,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    Text(product.category),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${product.price} \$'),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                            Text('${product.quantity}'),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
