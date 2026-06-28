
 import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../products/presentation/screen/productlist_bycategory.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategory.name,arguments: {
          'categoryId':'feio',
          'categoryName':'Electronics'
        });

      },
      child: Column(
          children: [

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Icon(Icons.computer,
                  size: 48,
                  color: AppColors.themeColor),
            ),

            const SizedBox(height: 4,),

            Text("Computer",style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.themeColor
            ),)



          ]

      ),
    );
  }
}

