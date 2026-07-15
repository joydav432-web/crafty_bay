import 'package:crafty_bay/features/shered/presentation/provider/main_nav_provider.dart';
import 'package:crafty_bay/features/shered/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/category_providers.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static const String name = '/category';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CategoryProvider>().getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _backToHome(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Category'),
        ),
        body: Consumer<CategoryProvider>(
          builder: (context, provider, child) {
            if (provider.categoryInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (provider.errorMessage != null) {
              return Center(
                child: Text(provider.errorMessage!),
              );
            }

            if (provider.categories.isEmpty) {
              return const Center(
                child: Text('No Category Found'),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: provider.categories.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: provider.categories[index],
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavProvider>().backToHome();
  }
}