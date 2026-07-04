import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChanges});

  final List<String>colors;
  final Function(String) onChanges;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {

  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: widget.colors.map((color) {
        return GestureDetector(
          onTap: (){

            setState(() {
              _selectedColor = color;
              widget.onChanges(color);
            });
            },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),

            decoration: BoxDecoration(
              border: Border.all(color: AppColors.themeColor),

              borderRadius: BorderRadius.circular(8),
              color:color==_selectedColor? AppColors.themeColor:null




            ),

            child: Text(color,style: TextStyle(
              fontSize: 16,
                color:color==_selectedColor? Colors.white:null

            ),),
          ),
        );
      }).toList(),
    );
  }
}
