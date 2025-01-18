/// message : null
/// data : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiI0IiwibmJmIjoxNzM3MTk2MDk5LCJleHAiOjE3Mzg0MDU2OTksImlhdCI6MTczNzE5NjA5OSwiaXNzIjoiV2ViLUFwcGxpY2F0aW9uIiwiYXVkIjoiV2ViLUFwaSJ9.FB5SzgW_xTwDSNaWS9WH1itrflM095jOBD59ENOqwJQ","country_code":null,"phone":null,"is_completed":true,"otp":null,"role":"Customer"}
/// error : null

class VerifyOtpEntity {
  VerifyOtpEntity({
    this.message,
    this.data,
    this.error,
  });

  VerifyOtpEntity.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  dynamic message;
  Data? data;
  dynamic error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['error'] = error;
    return map;
  }
}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9zaWQiOiI0IiwibmJmIjoxNzM3MTk2MDk5LCJleHAiOjE3Mzg0MDU2OTksImlhdCI6MTczNzE5NjA5OSwiaXNzIjoiV2ViLUFwcGxpY2F0aW9uIiwiYXVkIjoiV2ViLUFwaSJ9.FB5SzgW_xTwDSNaWS9WH1itrflM095jOBD59ENOqwJQ"
/// country_code : null
/// phone : null
/// is_completed : true
/// otp : null
/// role : "Customer"

class Data {
  Data({
    this.token,
    this.countryCode,
    this.phone,
    this.isCompleted,
    this.otp,
    this.role,
  });

  Data.fromJson(dynamic json) {
    token = json['token'];
    countryCode = json['country_code'];
    phone = json['phone'];
    isCompleted = json['is_completed'];
    otp = json['otp'];
    role = json['role'];
  }

  String? token;
  dynamic countryCode;
  dynamic phone;
  bool? isCompleted;
  dynamic otp;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['country_code'] = countryCode;
    map['phone'] = phone;
    map['is_completed'] = isCompleted;
    map['otp'] = otp;
    map['role'] = role;
    return map;
  }
}
