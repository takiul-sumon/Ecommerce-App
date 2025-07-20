// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photos;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photos,
  });
  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<String> l = [];
    for (String s in jsonData['photos']) {
      l.add(s);
    }
    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: jsonData['current_price'],
      photos: List<String>.from(jsonData['photos']),
    );
  }
}
