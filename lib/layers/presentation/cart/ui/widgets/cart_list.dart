import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/layers/presentation/cart/ui/widgets/cart_item.dart';

class CartList extends StatelessWidget {
  final List<ProductEntity> products;
  const CartList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (context, index) => Gap(20.h),
      itemBuilder: (context, index) => CartItem(product: products[index]),
    );
  }
}
