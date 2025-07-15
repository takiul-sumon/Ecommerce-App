class SignUpRequestModel {
  final String email;
  final String firstName;
  final String lasttName;
  final String city;
  final String phone;
  final String password;

  SignUpRequestModel({
    required this.email,
    required this.firstName,
    required this.lasttName,
    required this.city,
    required this.phone,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lasttName,
      "email": email,
      "password": password,
      "phone": phone,
      "city": city,
    };
  }
}
