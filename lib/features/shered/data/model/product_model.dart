class ProductModel {
  final String id;
  final String title;
  final int price;
  final List<String> photos;
  final double rating;
  final int quantity;


  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.photos,
    required this.rating,
    required this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      price: jsonData['current_price'],
      photos: List.from(jsonData['photos']),
      quantity: jsonData['quantity'],
      rating: 4.0,
    );
  }
}
