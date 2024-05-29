import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/layers/presentation/cart/cubit/cart_cubit.dart';

class DeleteCartButton extends StatelessWidget {
  const DeleteCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<CartCubit>().deleteCart();
      },
      icon: const Icon(Icons.delete_rounded),
    );
  }
}