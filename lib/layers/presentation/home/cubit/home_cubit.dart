import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:shopink/layers/domain/entities/product.dart';
import 'package:shopink/layers/domain/repositories/products_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductsRepo productsRepo;
  HomeCubit({required this.productsRepo}) : super(HomeInitial());

  List<ProductEntity> _allProducts = [];
  // final Map<String, String> _categories;

  Future<void> getProducts() async {
    if (_allProducts.isNotEmpty) {
      emit(HomeSuccess(_allProducts));
    } else {
      emit(HomeLoading());
      final result = await productsRepo.getProducts();
      result.fold(
        (failure) => emit(HomeError(failure.message)),
        (products) {
          _allProducts = products;
          emit(HomeSuccess(products));
        },
      );
    }
  }

  Future<void> filter({required String category}) async {
    emit(HomeLoading());

    final result = await productsRepo.filter(category: category);
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (products) => emit(HomeSuccess(products)),
    );
  }
}
