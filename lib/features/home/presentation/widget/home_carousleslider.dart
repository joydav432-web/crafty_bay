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
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade200,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      slider.photoUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.error, size: 40),
                        );
                      },
                    ),
                  ),
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
