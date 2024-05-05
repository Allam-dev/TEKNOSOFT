import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/core/di/dependency_injection.dart';
import 'package:shopink/layers/presentation/home/cubit/home_cubit.dart';
import 'package:shopink/layers/presentation/home/ui/widgets/filtar_button.dart';
import 'package:shopink/core/ui/widgets/no_products_text.dart';
import 'package:shopink/layers/presentation/home/ui/widgets/products_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getProducts(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Shopink"),
              actions: const [FiltarButton()],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    List<ProductEntity>? products = state.products;
                    if (products.isNotEmpty) {
                      return ProductsGridView(products: products);
                    } else {
                      return const NoProductsText();
                    }
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
