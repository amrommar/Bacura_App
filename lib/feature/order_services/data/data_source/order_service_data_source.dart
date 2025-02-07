import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';

abstract class BaseOrderServiceDataSource {
  Future<void> orderService({required OrderServicesParams orderServicesParams});
}

class OrderServiceDataSource extends BaseOrderServiceDataSource {
  @override
  Future<void> orderService({required OrderServicesParams orderServicesParams}) async {
    await ApiClient().apiCall(
      requestType: RequestType.POST,
      url: ApiEndPoint.ordersPath,
      body: orderServicesParams.toMap(),
    );
  }
}
