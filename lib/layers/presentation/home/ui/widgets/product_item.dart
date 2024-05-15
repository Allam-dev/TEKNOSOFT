import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/core/ui/widgets/app_network_image.dart';
import 'package:shopink/layers/domain/repositories/cart_repo.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await getIt<CartRepo>().addProduct(product: product);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: ColorManager.lightGrey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: AppNetworkImage(
              src: product.imageUrl,
              width: double.infinity,
            )),
            Text(
              product.name,
              style: TextStyles.font15BlackNormal,
              maxLines: 1,
            ),
            Text(
              product.category,
              style: TextStyles.font15GrayNormal,
            ),
            Text(
              '${product.price} \$',
              style: TextStyles.font15GreenNormal,
            ),
          ],
        ),
      ),
    );
  }
}
