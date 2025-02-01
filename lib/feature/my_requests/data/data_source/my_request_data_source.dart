import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/feature/my_requests/data/model/my_request_model.dart';
import 'package:bacura_app/feature/my_requests/domin/entity/my_request_entity.dart';
import 'package:bacura_app/feature/my_requests/domin/use_case/get_my_requests_use_case.dart';
import 'dart:convert';

abstract class BaseRequestDataSource {
  Future<MyRequestEntity> getRequest({required MyRequestsParameters myRequestsParameters});
}

class MyRequestDataSource extends BaseRequestDataSource {
  @override
  Future<MyRequestEntity> getRequest({required MyRequestsParameters myRequestsParameters}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: ApiEndPoint.ordersPath,
        body: myRequestsParameters.toMap(),
      );

      if (response != null) {
        final data = jsonDecode(response.data);

        if (data is Map<String, dynamic>) {
          return MyRequestModel.fromJson(data);
        } else {
          throw Exception("Invalid API response format: Expected Map<String, dynamic>");
        }
      } else {
        throw Exception("API response is null");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
