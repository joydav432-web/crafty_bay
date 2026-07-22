
import 'package:crafty_bay/features/cart/provider/add_to_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constant.dart';


class TotalPrizeAddToCartSection extends StatelessWidget {
   TotalPrizeAddToCartSection({
    super.key, this.onTapAddToCart,
  });

  final  VoidCallback? onTapAddToCart;



  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withAlpha(30),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          )

      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Prize",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,

                ),
              ),

              Text('${Constant.takaSign} 100',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.themeColor
                ),
              ),

            ],
          ),

          SizedBox(
            width: 140,
            child: Consumer<AddToCartProvider>(
              builder: (context,addToCartProvider,_){

                if (addToCartProvider.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return FilledButton(onPressed: onTapAddToCart,
                    child: Text("Add to cart"));
              }
            ),
          )
        ],
      ),
    );
  }
}
