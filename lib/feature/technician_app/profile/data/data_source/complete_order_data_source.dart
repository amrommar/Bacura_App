import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/feature/my_orders/data/model/my_order_data_model.dart';
import 'package:bacura_app/feature/my_orders/data/model/my_order_model.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/completed_orders_use_case.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/get_orders_calender_use_case.dart';

abstract class BaseCompletedOrderDataSource {
  Future<MyOrderEntity> completedOrder({required MyCompletedOrdersParameters myCompletedOrdersParameters});
  Future<List<MyOrderDataEntity>> calenderOrders({required MyOrdersCalenderParameter myOrdersCalenderParameter});
}

class CompletedOrderDataSource extends BaseCompletedOrderDataSource {
  @override
  Future<MyOrderEntity> completedOrder({required MyCompletedOrdersParameters myCompletedOrdersParameters}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: 'orders?status=completed',
        queryParameters: myCompletedOrdersParameters.toMap(),
      );

      if (response != null) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          return MyOrderModel.fromJson(data);
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

  @override
  @override
  Future<List<MyOrderDataEntity>> calenderOrders({required MyOrdersCalenderParameter myOrdersCalenderParameter}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: 'orders/calendar',
        queryParameters: myOrdersCalenderParameter.toMap(),
      );

      if (response != null) {
        final data = response.data;

        if (data is Map<String, dynamic> && data["data"] is List) {
          return (data["data"] as List).map((order) => MyOrderDataModel.fromJson(order)).toList();
        } else {
          throw Exception("Invalid API response format: Expected List in 'data' key");
        }
      } else {
        throw Exception("API response is null");
      }
    } catch (e) {
      throw Exception("Error fetching calendar orders: $e");
    }
  }
}
