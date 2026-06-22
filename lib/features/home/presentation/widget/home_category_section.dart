import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){

            return Column(
                children: [

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor.withAlpha(20),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.computer,
                        size: 48,
                        color: AppColors.themeColor),
                  ),

                  Text("Computer",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.themeColor
                  ),)



                ]

            );

          },
          separatorBuilder: (_,_)=>SizedBox(width: 8,),
          itemCount: 15),
    );
  }
}

