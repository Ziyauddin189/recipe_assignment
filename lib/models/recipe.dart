class Recipe {
  final String dishId;
  final String dishName;
  final String imageUrl;
  final bool isPublished;

  Recipe({required this.dishId, required this.dishName, required this.imageUrl, required this.isPublished});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      dishId: json['dishId'],
      dishName: json['dishName'],
      imageUrl: json['imageUrl'],
      isPublished: json['isPublished'],
    );
  }
}