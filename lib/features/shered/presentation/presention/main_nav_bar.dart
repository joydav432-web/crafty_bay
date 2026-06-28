import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/category/presentation/screen/category_screen.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:crafty_bay/features/shered/presentation/provider/main_nav_provider.dart';
import 'package:crafty_bay/features/wishlist/presentation/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavBar extends StatefulWidget {
  const MainNavBar({super.key});

  static const String name = '/main-nav';

  @override
  State<MainNavBar> createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {

  final List <Widget> _screens =[
    const HomeScreen(),
    const CategoryScreen(),
    const HomeScreen(),
    const WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavProvider>(
      builder: (context,mainNavProvider,_) {
        return Scaffold(
          body: _screens[mainNavProvider.currentIndex],


          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainNavProvider.currentIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: AppColors.themeColor,
              showSelectedLabels: true,

              onTap: mainNavProvider.changeIndex,
              items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "category"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "wishlist")
          ]),
        );
      }
    );
  }
}
