import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopink/layers/presentation/cart/ui/cart_screen.dart';
import 'package:shopink/layers/presentation/home/ui/home_screen.dart';
import 'package:shopink/layers/presentation/orders/orders_screen.dart';
import 'package:shopink/layers/presentation/settings/ui/settings_screen.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationIndex(0));

  int _previousIndex = 0;
  final PageController pageController = PageController();
  final List<Widget> screens = const [
    HomeScreen(),
    CartScreen(),
    OrdersScreen(),
    SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list),
      label: 'Orders',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  Future<void> changeIndex(int index) async {
    if (_previousIndex != index) {
      _previousIndex = index;
       pageController.jumpToPage(index);
      emit(BottomNavigationIndex(index));
    }
  }
}
