import 'package:crafty_bay/features/shered/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shered/presentation/provider/main_nav_provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_)=>_backToHome(),

      child: Scaffold(
        appBar: AppBar(


          title: const Text('wishlist'),
          leading: IconButton(onPressed: (){
            _backToHome();

          },
              icon: Icon(Icons.arrow_back_ios)),


        ),
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return const FittedBox(child: ProductCard());
          },
        ),
      ),
    );
  }


  void _backToHome(){
    context.read<MainNavProvider>().backToHome();
  }
}
