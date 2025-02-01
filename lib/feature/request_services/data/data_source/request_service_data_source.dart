import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/feature/request_services/domin/use_case/request_services_use_case.dart';

abstract class BaseRequestServiceDataSource {
  Future<void> requestService({required RequestServicesParams requestServicesParams});
}

class RequestServiceDataSource extends BaseRequestServiceDataSource {
  @override
  Future<void> requestService({required RequestServicesParams requestServicesParams}) async {
    await ApiClient().apiCall(
      requestType: RequestType.POST,
      url: ApiEndPoint.ordersPath,
      body: requestServicesParams.toMap(),
    );
  }
}
