
import 'package:flutter/material.dart';

import '../widget/home_appbar.dart';
import '../widget/home_carousleslider.dart';
import '../widget/home_category_section.dart';
import '../widget/product_searchbar.dart';
import '../widget/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      
      appBar: HomeAppbar(),
      
      body: SingleChildScrollView(
        padding:EdgeInsets .all(16),
        child: Column(
          spacing: 12,
          children: [

            ProductSearchbar(),


            HomeCarousle(),

            SectionHeader(headerText: 'Category', onTapSeeAll: () {


            },),

            HomeCategorySection()
            
          ],
        ),
      ),
    );
  }
}

