// import 'package:flutter/material.dart';
// import 'package:shopink/layers/presentation/cart/ui/cart_screen.dart';
// import 'package:shopink/layers/presentation/home/ui/home_screen.dart';
// import 'package:shopink/layers/presentation/orders/orders_screen.dart';
// import 'package:shopink/layers/presentation/settings/ui/settings_screen.dart';

// class BottomNavigationBarLayout extends StatefulWidget {
//   const BottomNavigationBarLayout({super.key});

//   @override
//   State<BottomNavigationBarLayout> createState() =>
//       _BottomNavigationBarLayoutState();
// }

// class _BottomNavigationBarLayoutState extends State<BottomNavigationBarLayout> {
//   int _selectedIndex = 0;

//   final PageController _controller = PageController();

//   void onTap(int index) {
//     if (_selectedIndex != index) {
//       _controller.jumpToPage(index);
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const CartScreen(),
//     const OrdersScreen(),
//     const SettingsScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _controller,
//         onPageChanged: onTap,
//         children: _screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: onTap,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_rounded),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_rounded),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.receipt_long),
//             label: 'Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings_rounded),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopink/layers/presentation/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';

class BottomNavigationBarLayout extends StatelessWidget {
  const BottomNavigationBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: Builder(builder: (context) {
        final bottomNavigationCubit = context.read<BottomNavigationCubit>();
        return Scaffold(
          body: PageView(
            controller: bottomNavigationCubit.pageController,
            onPageChanged: bottomNavigationCubit.changeIndex,
            children: bottomNavigationCubit.screens,
          ),
          bottomNavigationBar:
              BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            builder: (context, state) {
              switch (state) {
                case BottomNavigationIndex():
                  return BottomNavigationBar(
                    currentIndex: state.index,
                    onTap: context.read<BottomNavigationCubit>().changeIndex,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: context
                        .read<BottomNavigationCubit>()
                        .bottomNavigationBarItems,
                  );
              }
            },
          ),
        );
      }),
    );
  }
}
