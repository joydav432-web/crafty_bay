import 'package:crafty_bay/features/shered/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListByCategory extends StatefulWidget {
  const ProductListByCategory({super.key, required this.categoryId,
    required this.categoryName});

  final String categoryId;
  final String categoryName;

  static const String name = '/product-list-by-category';

  @override
  State<ProductListByCategory> createState() => _ProductListByCategoryState();
}

class _ProductListByCategoryState extends State<ProductListByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              mainAxisSpacing: 8,
              crossAxisCount: 2),

          itemBuilder: (context,index){

        return FittedBox(child: ProductCard());
        
          })


    );
  }
}
