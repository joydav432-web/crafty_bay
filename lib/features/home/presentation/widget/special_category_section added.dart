import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../category/presentation/screen/category_provider.dart';
import '../../../shered/presentation/widgets/category_card.dart';

class SpecialCategorySection extends StatelessWidget {
  const SpecialCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Consumer<CategoryListProvider>(
          builder: (context, categoryListProvider, _) {
            if (categoryListProvider.isInitialLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final categories = categoryListProvider.categoryList
                .skip(20)
                .take(10)
                .toList();

            return ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryCard(
                  categoryModel: categories[index],
                );
              },
              separatorBuilder: (_, _) => const SizedBox(width: 8),
            );
          }
      ),
    );
  }
}
