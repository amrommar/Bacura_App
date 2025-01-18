import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/feature/profile/domain/use_case/complete_profile_use_case.dart';

abstract class BaseProfileDataSource {
  Future<void> completeProfileData(CompleteParameter completeParameter);
}

class ProfileDataSource extends BaseProfileDataSource {
  @override
  Future<void> completeProfileData(CompleteParameter completeParameter) async {
    await ApiClient().apiCall(
      requestType: RequestType.PATCH,
      url: ApiEndPoint.completeProfilePath,
      body: completeParameter.toMap(),
    );
  }
}
