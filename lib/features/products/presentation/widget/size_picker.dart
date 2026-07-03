import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onChanges});

  final List<String>size;
  final Function(String) onChanges;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {

  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: widget.size.map((size) {
        return GestureDetector(
          onTap: (){

            setState(() {
              _selectedSize = size;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),

            decoration: BoxDecoration(
                border: Border.all(color: AppColors.themeColor),

                borderRadius: BorderRadius.circular(8),
                color:_selectedSize==size? AppColors.themeColor:null




            ),

            child: Text(size,style: TextStyle(
                fontSize: 16,
                color:_selectedSize==size? Colors.white:null


            ),),
          ),
        );
      }).toList(),
    );
  }
}
