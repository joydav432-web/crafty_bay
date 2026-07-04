
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';


class AddReviewCart extends StatelessWidget {
  const AddReviewCart({
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

          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [

              Text("Reviews",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500

                ),
              ),



              Text('( 1000 )',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  color: Colors.grey.shade500
                ),
              ),

            ],
          ),

          SizedBox(
            width: 140,
            child: IconButton(onPressed: (){},
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.themeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                icon: Icon(Icons.add,
                color: Colors.white,
                ))
          )
        ],
      ),
    );
  }
}
