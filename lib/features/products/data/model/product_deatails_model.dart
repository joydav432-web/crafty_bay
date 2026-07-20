class ProductDetailsModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final List<String> photos;
  final List<String> size;
  final List<String> colors;
  final int currentPrice;
  final int quantity;
  final double rating;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.photos,
    required this.size,
    required this.colors,
    required this.currentPrice,
    required this.quantity,
    required this.rating,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      photos: List<String>.from(json['photos'] ?? []),
      size: List<String>.from(json['sizes'] ?? []),
      colors: List<String>.from(json['colors'] ?? []),
      currentPrice: json['current_price'] ?? 0,
      quantity: json['quantity'] ?? 0,
      rating: (json['rating'] ?? 4.9).toDouble(),
    );
  }
}