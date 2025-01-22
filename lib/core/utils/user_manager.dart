/// [UserManager] is a utility class used get authorization cached data easily
class UserManager {
  static String defaultAppTenant = "1";
  static String? accessToken;
  static String? refreshToken;

  static init() async {
    await Future.wait([]);
  }
}
