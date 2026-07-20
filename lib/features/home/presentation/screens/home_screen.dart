
import 'package:crafty_bay/features/home/presentation/widget/populer_category_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../shered/presentation/provider/main_nav_provider.dart';
import '../provider/home_sliderproviders.dart';
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
        scrollDirection: Axis.vertical,
        padding:EdgeInsets .all(16),
        child: Column(
          spacing: 12,
          children: [

            ProductSearchbar(),

            Consumer<HomeSliderProviders>(
              builder: (context,homeSliderProviders,_) {

                if(homeSliderProviders.sliderInProgress){
                  return SizedBox(
                    height: 180,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }else{

                  return HomeCarousle(sliders: homeSliderProviders.slider);

                }

              }
            ),

            SectionHeader(headerText: 'Category', onTapSeeAll: () {

              context.read<MainNavProvider>().backToCategory();


            },),

            HomeCategorySection(),

            SectionHeader(headerText: "Popular", onTapSeeAll: (){}),

            PopularCategorySection(),






            SectionHeader(headerText: "Special", onTapSeeAll: (){}),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                 // children: [1,2,3,4,5,6,7,8,9,10].map((e)=>ProductCard()).toList()
              ),
            ),

            SectionHeader(headerText: "New", onTapSeeAll: (){}),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                 // children: [1,2,3,4,5,6,7,8,9,10].map((e)=>ProductCard()).toList()
              ),
            ),







          ],
        ),
      ),
    );
  }
}

