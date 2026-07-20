import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncreDecreButton extends StatefulWidget {
  const IncreDecreButton({super.key,
    required this.maxCount,
    required this.minCount,
    required this.initialValue,
    required this.onChange});

  final int maxCount;
  final int minCount;
  final int initialValue;
  final Function(int) onChange;


  @override
  State<IncreDecreButton> createState() => _IncreDecreButtonState();
}

class _IncreDecreButtonState extends State<IncreDecreButton> {

  int _counter = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initialValue;

  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        _iconButton(Icons.remove, (){

          if(_counter > widget.minCount){
            setState(() {
              _counter--;
            });
            widget.onChange(_counter);
          }


        },_counter == widget.minCount),



        Text(
          '$_counter',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
        ),

        _iconButton(Icons.add, (){

          if(_counter < widget.maxCount){
            setState(() {
              _counter++;
            });
            widget.onChange(_counter);
          }

        },_counter == widget.maxCount)

      ],


    );
  }


  Widget _iconButton(IconData icon,VoidCallback onTap,bool disabled){

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: disabled?Colors.grey.shade300:AppColors.themeColor.withAlpha(50),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Icon(icon,
          size: 20,
          color: Colors.white,
        )

      )
    );
  }
}
