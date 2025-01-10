class LoginRequestModel {
  final String phone;
  final String countryCode;

  LoginRequestModel({required this.phone, required this.countryCode});

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'country_code': countryCode,
    };
  }
}
