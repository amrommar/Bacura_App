class APIResponse<T> {
  T? data;
  String? message;
  String? error;

  APIResponse(this.data, this.message, this.error);

  factory APIResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>)? builder) {
    return APIResponse(
      json['data'] != null && builder != null ? builder(json['data']) : null,
      json['message'] as String?,
      json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['data'] = data;
    jsonData['message'] = message;
    jsonData['error'] = error;
    return jsonData;
  }

  bool get isSuccess => error == null;
}
