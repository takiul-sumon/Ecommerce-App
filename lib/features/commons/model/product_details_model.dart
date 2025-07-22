class ProductDetailsModel {
  final String id;
  final String title;
  final int currentPrice;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.description,
    required this.photos,
    required this.colors,
    required this.sizes,
  });
  factory ProductDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductDetailsModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: jsonData['current_price'],
      description: jsonData['description'],
      photos: List<String>.from(jsonData['photos']),
      colors: List<String>.from(jsonData['colors']),
      sizes: List<String>.from(jsonData['sizes']),
    );
  }
}
