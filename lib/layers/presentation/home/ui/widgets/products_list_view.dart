import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/layers/presentation/home/ui/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) => ProductItem(product: products[index]),
    );
  }
}
