import 'package:flutter/material.dart';

import '../../../category/data/model/category_model.dart';
import '../../../shered/presentation/widgets/category_card.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){

            return CategoryCard(categoryModel: CategoryModel(
              id: '',
              title: '',
              icon: '',)
            );

          },
          separatorBuilder: (_,_)=>SizedBox(width: 8,),
          itemCount: 15),
    );
  }
}

