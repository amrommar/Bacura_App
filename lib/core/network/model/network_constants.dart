class NetworkConstants {
  /// Development
  static const String developmentBaseUrl = "http://89.250.75.77:5278/api/";

  static const Duration timeOutDuration = Duration(seconds: 30);

  static String contentTypeKey = "Content-Type";
  static String acceptKey = "accept";
  static String acceptLanguageKey = 'Accept-Language';
  static String tenantIdKey = "Abp.TenantId";
  static String countryIdKey = "CountryId";
  static String authorizationKey = "Authorization";

  static String multipartValue = "multipart/form-data";
  static String jsonTypeValue = "application/json-patch+json";
  static String acceptValue = "text/plain";
  static const String repetitiveException = "Repetitive_Exception";

  ///signalR Events
  static const String onConnectEvent = "OnConnect";
  static const String sendMessageEvent = "SendMessage";
  static const String receiveMessageEvent = "RecieveMessage";
  static const String messageIsSeenEvent = "MessageIsSeen";
  static const String markAsSeenEvent = "MarkAsSeen";
  static const String userIsOnlineEvent = "UserIsOnline";
  static const String userIsOfflineEvent = "UserIsOffline";
}

class NetworkStatusCodes {
  static const int success = 200;
  static const int unAuthorized = 401;
  static const int notFound = 404;
  static const int conflict = 409;
  static const int serverSideError = 500;
}
