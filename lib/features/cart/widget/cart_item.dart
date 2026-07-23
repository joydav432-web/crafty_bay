import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_colors.dart';
import '../../../app/assets_images.dart';
import '../../../app/constant.dart';
import '../../shered/presentation/widgets/incre_decre_button.dart';
import '../data/model/cart_model.dart';
import '../provider/cart_list_provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      shadowColor: AppColors.themeColor.withAlpha(40),
      elevation: 2,

      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsPath.shoe, width: 100),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                spacing: 8,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              cartItemModel.product.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),

                            Text(
                              'Color: ${cartItemModel.color ?? ''}  Size: ${cartItemModel.size ?? ''}',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete_outline),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${Constant.takaSign} ${cartItemModel.product.price}',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.themeColor,
                        ),
                      ),

                      SizedBox(
                        width: 80,
                        child: IncreDecreButton(
                          maxCount: 20,
                          minCount: cartItemModel.product.quantity,
                          initialValue: cartItemModel.quantity,
                          onChange: (int value) {
                            context
                                .read<CartListProvider>()
                                .updateCardItemQuantity(
                                  cartItemModel.id,
                                  value,
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
