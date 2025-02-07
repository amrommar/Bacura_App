import 'package:bacura_app/feature/my_orders/data/model/my_request_data_model.dart';
import 'package:bacura_app/feature/my_orders/domin/entity/my_request_entity.dart';

class MyRequestModel extends MyRequestEntity {
  const MyRequestModel({
    required super.myRequestDataEntity,
    required super.limit,
    required super.page,
    required super.totalRecords,
    required super.totalPages,
    required super.nextPageLink,
    required super.previousPageLink,
  });

  factory MyRequestModel.fromJson(Map<String, dynamic> json) => MyRequestModel(
        myRequestDataEntity:
            (json["data"] as List<dynamic>?)?.map((item) => MyRequestDataModel.fromJson(item)).toList() ?? [],
        limit: json["limit"] ?? 0,
        page: json["page"] ?? 0,
        totalRecords: json["total_records"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        nextPageLink: json["next_page_link"] ?? "",
        previousPageLink: json["previous_page_link"] ?? "",
      );
}
