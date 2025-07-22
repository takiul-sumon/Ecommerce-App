
class CatagoryListModel {
  final String title;
  final String id;
  final String icon;

  CatagoryListModel({
    required this.title,
    required this.id,
    required this.icon,
  });
  factory CatagoryListModel.fromJson(Map<String, dynamic> jsonData) {
    return CatagoryListModel(
      title: jsonData['title'],
      id: jsonData['_id'],
      icon: jsonData['icon'],
    );
  }
} 

