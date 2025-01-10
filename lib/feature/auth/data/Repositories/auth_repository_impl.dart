import 'package:bacura_app/feature/auth/data/DataSource/auth_remote_data_source.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> login(User user) async {
    final loginModel = LoginRequestModel(
      phone: user.phone,
      countryCode: user.countryCode,
    );

    await remoteDataSource.login(loginModel);
  }
}
