
 import 'package:crafty_bay/features/category/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../products/presentation/screen/productlist_bycategory.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListByCategory.name,arguments: {
          'categoryId':categoryModel.id,
          'categoryName':categoryModel.title
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
              child: Image.network(categoryModel.icon,
              width: 48,
                  height: 48,

                errorBuilder: (_,_,_){
                return Icon(Icons.error);
                },
              ),
            ),

            const SizedBox(height: 4,),

            Text(categoryModel.title,style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.themeColor
            ),)



          ]

      ),
    );
  }
}

