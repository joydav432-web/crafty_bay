import 'package:crafty_bay/features/cart/widget/totalprizeand_checkout.dart';
import 'package:crafty_bay/features/shered/presentation/provider/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_list_provider.dart';
import '../../widget/cart_item.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartListProvider _cartListProvider = CartListProvider();

  @override
  void initState() {
    super.initState();
    _cartListProvider.getCartList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _cartListProvider,
      child: PopScope(
        onPopInvokedWithResult: (_, _) => _backToHome(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            leading: IconButton(
              onPressed: _backToHome,
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Consumer<CartListProvider>(
            builder: (context, _, _) {
              if (_cartListProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }

              if (_cartListProvider.errorMessage != null) {
                return Center(child: Text(_cartListProvider.errorMessage!));
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _cartListProvider.cartList.length,
                      itemBuilder: (context, index) {
                        return CartItem(
                          cartItemModel: _cartListProvider.cartList[index],
                        );
                      },
                    ),
                  ),

                  TotalPrizeAndCheckOutSection()
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavProvider>().backToHome();
  }
}