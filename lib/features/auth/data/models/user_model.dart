class UserModel {
  final String id;
  final String firstName;
  final String lastname;
  final String phone;
  final String email;
  final String avaterUrl;
  final String city;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.avaterUrl,
    required this.city,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      firstName: jsonData['firstName'] ?? '',
      lastname: jsonData['lastname'] ?? '',
      email: jsonData['email'],
      avaterUrl: jsonData['avaterUrl'],
      city: jsonData['city'],
      phone: jsonData['phone'] ?? '',
    );
  }
  Map<String, String> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastname': lastname,
      'email': email,
      'avaterUrl': avaterUrl,
      'city': city,
      'phone': phone,
    };
  }
}
