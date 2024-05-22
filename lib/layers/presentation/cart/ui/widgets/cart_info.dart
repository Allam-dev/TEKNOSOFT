import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/core/extensions/context/navigation.dart';
import 'package:shopink/core/routing/routes.dart';
import 'package:shopink/core/services/localization/locale_keys.g.dart';
import 'package:shopink/core/ui/theming/text_styles.dart';
import 'package:shopink/core/ui/widgets/app_button.dart';
import 'package:shopink/layers/presentation/cart/cubit/cart_cubit.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(5, 5),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${LocaleKeys.total.tr()} : ",
                style: TextStyles.font15GrayNormal,
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartSuccess) {
                    return Text(
                      state.cart.totalPrice.toString(),
                      style: TextStyles.font15BlackNormal,
                    );
                  } else {
                    return Text(
                      '0',
                      style: TextStyles.font15BlackNormal,
                    );
                  }
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${LocaleKeys.count.tr()} : ",
                style: TextStyles.font15GrayNormal,
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartSuccess) {
                    return Text(
                      state.cart.totalItems.toString(),
                      style: TextStyles.font15BlackNormal,
                    );
                  } else {
                    return Text(
                      '0',
                      style: TextStyles.font15BlackNormal,
                    );
                  }
                },
              ),
            ],
          ),
          AppButton(
              child: Text(LocaleKeys.checkout.tr()),
              onPressed: () {
                context.pushNamed(Routes.checkoutRoute);
              }),
        ],
      ),
    );
  }
}
