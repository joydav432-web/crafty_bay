import 'package:crafty_bay/features/shered/presentation/provider/main_nav_provider.dart';
import 'package:crafty_bay/features/shered/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(

      canPop: false,
      onPopInvokedWithResult: (_,_)=>_backToHome(),

      child: Scaffold(

        appBar: AppBar(
          leading: IconButton(onPressed: (){
            _backToHome();

          },
              icon: Icon(Icons.arrow_back_ios)),

          title: Text("Category"),
        ),


        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context,index){

              return CategoryCard();
      }),
      ),
    );
  }

  void _backToHome(){
    context.read<MainNavProvider>().backToHome();
  }
}
