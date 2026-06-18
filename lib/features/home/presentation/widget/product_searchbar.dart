import 'package:flutter/material.dart';

class ProductSearchbar extends StatelessWidget {
  const ProductSearchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          prefixIcon: Icon(Icons.search),
          hintText: 'search',


          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),

          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          ),


          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.transparent
              )
          )
      ),


    );
  }
}

