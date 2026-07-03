import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_images.dart';
import '../../../products/presentation/screen/product_details_screnn.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.pushNamed(context, ProductDetailsScreen.name,arguments: 'feio');
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        shadowColor: AppColors.themeColor.withAlpha(40),
        elevation: 2,
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 120,
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withAlpha(50),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))
                ),

                child: Image.asset(AssetsPath.shoe),

              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Title of Product",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black54
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text('\$100',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeColor
                          ),
                        ),

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
                    )




                  ],
                ),
              )


            ],
          ),

        ),
      ),
    );
  }
}

