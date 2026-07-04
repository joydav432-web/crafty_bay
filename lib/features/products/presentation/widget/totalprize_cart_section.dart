
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constant.dart';


class TotalPrizeAddToCartSection extends StatelessWidget {
  const TotalPrizeAddToCartSection({
    super.key,
  });

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
            child: FilledButton(onPressed: (){},
                child: Text("Add to cart")),
          )
        ],
      ),
    );
  }
}
