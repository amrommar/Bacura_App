import 'package:bacura_app/feature/profile/data/data_source/profile_data_source.dart';
import 'package:bacura_app/feature/profile/domain/repository/base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileDataSource baseProfileDataSource;

  ProfileRepository({required this.baseProfileDataSource});
}
