import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shopink/core/ui/theming/color_manager.dart';
import 'package:shopink/core/ui/widgets/app_network_image.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/layers/presentation/cart/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final ProductEntity product;
  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        context.read<CartCubit>().deleteProduct(product.id);
      },
      key: Key(product.id.toString()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
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
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: AppNetworkImage(
                  src: product.imageUrl,
                  scale: 2,
                )),
            Gap(20.w),
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
                              onPressed: () {
                                context
                                    .read<CartCubit>()
                                    .incrementProduct(product.id);
                              },
                            ),
                            Text('${product.quantityInCart}'),
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                context
                                    .read<CartCubit>()
                                    .decrementProduct(product.id);
                              },
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
