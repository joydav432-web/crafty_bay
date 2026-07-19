import 'package:crafty_bay/features/shered/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_list_provider.dart';

class ProductListByCategory extends StatefulWidget {
  const ProductListByCategory({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  static const String name = '/product-list-by-category';

  @override
  State<ProductListByCategory> createState() => _ProductListByCategoryState();
}

class _ProductListByCategoryState extends State<ProductListByCategory> {
  final ProductListProvider _productListProvider = ProductListProvider();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productListProvider.getProductData();
    _scrollController.addListener(_loadMore);
  }

  void _loadMore() async {
    if ((_productListProvider.isLoading == false) &&
        (_scrollController.position.extentBefore < 300)) {
      _productListProvider.getProductData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productListProvider,

      child: Scaffold(
        appBar: AppBar(title: Text(widget.categoryName)),
        body: Consumer<ProductListProvider>(
          builder: (context, productListProvider, _) {
            if (_productListProvider.isInitialLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: productListProvider.productList.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisCount: 2,
                    ),

                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: ProductCard(
                          productModel: productListProvider.productList[index],
                        ),
                      );
                    },
                  ),
                ),
                if (productListProvider.isLoadMoreLoading)
                  LinearProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scrollController.dispose();


  }
}
