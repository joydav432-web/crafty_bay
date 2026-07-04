import 'package:crafty_bay/features/reviews/widget/review_cart.dart';
import 'package:flutter/material.dart';

import '../widget/add_reviewcard.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  static const String name = '/review-screen';


  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Reviews'),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios)),
      ),


      body: Column(

        children: [

          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){

              return ReviewCart();
            }),
          ),


          const SizedBox(height: 10,),


          AddReviewCart(),

          const SizedBox(height: 10),



        ]
      ),
    );
  }
}
