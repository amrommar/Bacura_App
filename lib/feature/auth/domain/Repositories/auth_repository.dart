import '../entities/user.dart';

abstract class AuthRepository {
  Future<void> login(User user);
}
