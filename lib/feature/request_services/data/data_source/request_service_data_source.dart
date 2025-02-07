import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/feature/request_services/domin/use_case/request_services_use_case.dart';

abstract class BaseorderserviceDataSource {
  Future<void> orderservice({required orderservicesParams orderservicesParams});
}

class orderserviceDataSource extends BaseorderserviceDataSource {
  @override
  Future<void> orderservice({required orderservicesParams orderservicesParams}) async {
    await ApiClient().apiCall(
      requestType: RequestType.POST,
      url: ApiEndPoint.ordersPath,
      body: orderservicesParams.toMap(),
    );
  }
}
