import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';
import 'package:bacura_app/core/network/model/api_response.dart';
import 'package:bacura_app/feature/my_orders/data/model/items_for_order_model.dart';
import 'package:bacura_app/feature/my_orders/data/model/my_order_model.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/items_for_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/get_my_orders_use_case.dart';

abstract class BaseOrderDataSource {
  Future<MyOrderEntity> getOrder({required MyOrdersParameters myOrdersParameters});
  Future<List<ItemsForOrderEntity>> getItems({required int id});
}

class MyOrderDataSource extends BaseOrderDataSource {
  @override
  Future<MyOrderEntity> getOrder({required MyOrdersParameters myOrdersParameters}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: ApiEndPoint.ordersPath,
        queryParameters: myOrdersParameters.toMap(),
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
  Future<List<ItemsForOrderEntity>> getItems({required int id}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: 'orders/$id/items',
      );

      if (response?.data is Map<String, dynamic>) {
        var data = response?.data['data'];
        if (data is List) {
          return data.map((e) => ItemsForOrderModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print("Error fetching items: $e");
    }

    return []; // في حالة حدوث أي خطأ ترجع ليست فاضية
  }
}
