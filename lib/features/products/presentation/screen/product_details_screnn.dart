import 'package:crafty_bay/features/shered/presentation/widgets/incre_decre_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../reviews/screen/review_screen.dart';
import '../widget/color_picker.dart';
import '../widget/image_carosule_slider.dart';
import '../widget/size_picker.dart';
import '../widget/totalprize_cart_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;


  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Product Details'),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios)),

      ),

      body: Column(
        children: [

          Expanded(
              child: SingleChildScrollView(
                child: Column(
                            children: [
                
                ImageCarosuleSlider(),
                
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text('Adidas Sneaker for men 2026 Black',
                
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 28,
                                  color: Colors.black54
                              )
                          )),
                
                          SizedBox(
                            width: 80,
                            child: IncreDecreButton(
                                maxCount: 20,
                                minCount: 1,
                                initialValue: 1,
                                onChange: (newValue){}),
                          )
                        ],
                      ),
                
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 4,
                        children: [
                
                
                          Wrap(
                            spacing: 4,
                            children: [
                              Icon(Icons.star,
                                color: Colors.amber,
                              ),
                
                              Text('4.5',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),
                
                
                          TextButton(onPressed: (){

                            Navigator.pushNamed(context, ReviewScreen.name);
                          },
                              child: Text('Reviews')),
                
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color:AppColors.themeColor.withAlpha(80),
                                borderRadius: BorderRadius.circular(8 )
                            ),
                            child: Icon(Icons.favorite_outline,
                              size: 18,
                              color: Colors.white,
                            ),
                          )
                
                        ],
                      ),
                
                      const SizedBox(height: 10,),
                
                      Text('Color',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                          color: Colors.black54
                
                      )),
                
                      ColorPicker(colors: [
                        'Red','Yellow','White','Black'
                
                      ], onChanges: (String selectedColor) {
                
                        print(selectedColor);
                      },),
                
                
                
                
                
                      const SizedBox(height: 20,),
                      Text('Size',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                          color: Colors.black54
                
                      )),
                
                      SizePicker(size: [
                        'S','M','L','XL'
                      ], onChanges: (String selectedSize) {
                        print(selectedSize);
                      }
                      ),
                      const SizedBox(height: 20,),
                
                
                      Text('Description',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                          color: Colors.black54
                
                      )),
                      const SizedBox(height: 10,),
                
                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54
                        ),
                
                
                      ),
                
                
                
                
                
                
                
                    ],
                  ),
                ),
                
                            ],
                          ),
              )),

          TotalPrizeAddToCartSection(),

          const SizedBox( height: 10,),








        ],
      ),



    );
  }
}
