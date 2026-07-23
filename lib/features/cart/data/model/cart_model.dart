

import 'package:crafty_bay/features/shered/data/model/product_model.dart';

class CartItemModel{

  final String id;
  final ProductModel product;
  int quantity;
  final String? color;
  final String? size;


  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    this.color,
    this.size,
  });

  factory CartItemModel.fromJson(Map<String,dynamic>json){
    return CartItemModel(
      id: json['id'] ?? '',
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
      color: json['color'],
      size: json['size'],
    );
  }
}
