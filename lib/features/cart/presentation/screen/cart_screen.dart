import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shered/presentation/provider/main_nav_provider.dart';
import '../../widget/cart_item.dart';
import '../../widget/totalprizeand_checkout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_)=>_backToHome(),

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            _backToHome();

          },
              icon: Icon(Icons.arrow_back_ios)),

          title: const Text('Cart'),
        ),

        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){

                return CartItem();
              })
            ),

            TotalPrizeAndCheckOutSection()

          ],
        ),
      ),
    );
  }

  void _backToHome(){
    context.read<MainNavProvider>().backToHome();
  }
}

