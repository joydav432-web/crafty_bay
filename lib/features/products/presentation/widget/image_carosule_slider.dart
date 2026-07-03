

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarosuleSlider extends StatefulWidget {
  const ImageCarosuleSlider({super.key});

  @override
  State<ImageCarosuleSlider> createState() => _ImageCarosuleSliderState();
}

class _ImageCarosuleSliderState extends State<ImageCarosuleSlider> {
  final ValueNotifier <int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         CarouselSlider(

          options: CarouselOptions(height: 180.0,viewportFraction: 1,
              autoPlay: true,

              onPageChanged: (index,_){
                _selectedIndex.value = index;


              }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200
                    ),
                    child: Center(child: Text('text $i', style: TextStyle(fontSize: 16.0),))
                );
              },
            );
          }).toList(),
        ),


        ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context,index,_){

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  for(int i =0;i<5 ; i++)
                    Container(

                      margin: EdgeInsets.all(4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: i==index?Colors.brown:Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    )


                ],
              );


            }
        )



      ],
    );
  }
}
