

class CategoryModel {
  final String id;
  final String title;
  final String? slug;
  final String? description;
  final String icon;
  final String? parent;
  final DateTime? createdAt;
  final DateTime ?updatedAt;

  CategoryModel({
    required this.id,
    required this.title,
    this.slug,
    this.description,
    required this.icon,
    this.parent,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      parent: json['parent'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'icon': icon,
      'parent': parent,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}