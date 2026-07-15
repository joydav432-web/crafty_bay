import 'package:flutter/material.dart';

import '../../../category/model/category_model.dart';
import '../../../shered/presentation/widgets/category_card.dart';

class HomeCategorySection extends StatelessWidget {
  final List<CategoryModel> categories;

  const HomeCategorySection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}