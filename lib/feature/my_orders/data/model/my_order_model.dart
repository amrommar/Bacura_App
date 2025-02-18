import 'package:bacura_app/feature/my_orders/data/model/my_order_data_model.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';

class MyOrderModel extends MyOrderEntity {
  const MyOrderModel({
    required super.myOrderDataEntity,
    required super.limit,
    required super.page,
    required super.totalRecords,
    required super.totalPages,
    required super.nextPageLink,
    required super.previousPageLink,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
        myOrderDataEntity:
            (json["data"] as List<dynamic>?)?.map((item) => MyOrderDataModel.fromJson(item)).toList() ?? [],
        limit: json["limit"] ?? 0,
        page: json["page"] ?? 0,
        totalRecords: json["total_records"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        nextPageLink: json["next_page_link"] ?? "",
        previousPageLink: json["previous_page_link"] ?? "",
      );
}
