import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/features/home/data/model/slider_model.dart';
import 'package:flutter/material.dart';

class HomeCarousle extends StatefulWidget {
  const HomeCarousle({super.key, required this.sliders});

  final List<SliderModel> sliders;

  @override
  State<HomeCarousle> createState() => _HomeCarousleState();
}

class _HomeCarousleState extends State<HomeCarousle> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            autoPlay: true,

            onPageChanged: (index, _) {
              _selectedIndex.value = index;
            },
          ),
          items: widget.sliders.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: NetworkImage(slider.photoUrl),
                        onError: (_,_)=>Icon(Icons.error),
                        fit: BoxFit.cover

                      )
                  
                  
                  ),
                  alignment: Alignment.center,
                 
                );
              },
            );
          }).toList(),
        ),

        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.sliders.length; i++)
                  Container(
                    margin: EdgeInsets.all(4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: i == index ? Colors.brown : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
