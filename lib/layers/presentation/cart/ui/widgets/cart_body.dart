import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/ui/widgets/no_products_text.dart';
import 'package:shopink/layers/presentation/cart/cubit/cart_cubit.dart';
import 'package:shopink/layers/presentation/cart/ui/widgets/cart_info.dart';
import 'package:shopink/layers/presentation/cart/ui/widgets/cart_list.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartSuccess) {
                if (state.cart.products.isEmpty) {
                  return const NoProductsText();
                } else {
                  return CartList(
                    products: state.cart.products,
                  );
                }
              } else {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
            },
          ),
        ),
        const Expanded(
          flex: 4,
          child: CartInfo(),
        ),
      ],
    );
  }
}
