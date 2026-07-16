import 'package:crafty_bay/features/shered/presentation/provider/main_nav_provider.dart';
import 'package:crafty_bay/features/shered/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'category_provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  late final CategoryListProvider _categoryListProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_loadMore);
    _categoryListProvider = context.read<CategoryListProvider>();
  }

  void _loadMore() async {
    if ((_categoryListProvider.isLoading == false) &&
        (_scrollController.position.extentBefore < 300)) {
      _categoryListProvider.getCategoriesData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) => _backToHome(),

      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _backToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),

          title: Text("Category"),
        ),

        body: ChangeNotifierProvider.value(
          value: _categoryListProvider,
          child: Consumer<CategoryListProvider>(
            builder: (context,_,_) {

              if(_categoryListProvider.isInitialLoading){

                return Center(child: CircularProgressIndicator(),);
              }
              return Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _categoryListProvider.refreshCategoryList();
                      },
                      child: GridView.builder(
                        controller: _scrollController,
                        itemCount: _categoryListProvider.categoryList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return CategoryCard(categoryModel: _categoryListProvider.categoryList[index],);
                        },
                      ),
                    ),
                  ),
                  if(_categoryListProvider.isLoadMoreLoading)
                    LinearProgressIndicator()

                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _backToHome() {
    context.read<MainNavProvider>().backToHome();
  }
}
