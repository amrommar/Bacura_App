import 'package:bacura_app/feature/offers/data/model/offers_data_model.dart';
import 'package:bacura_app/feature/offers/domin/entity/offers_entity.dart';

class MyOffersModel extends OffersEntity {
  const MyOffersModel({
    required super.offersDataEntity,
    required super.limit,
    required super.page,
    required super.totalRecords,
    required super.totalPages,
    required super.nextPageLink,
    required super.previousPageLink,
  });

  factory MyOffersModel.fromJson(Map<String, dynamic> json) => MyOffersModel(
        offersDataEntity:
            (json["data"] as List<dynamic>?)?.map((item) => OffersDataModel.fromJson(item)).toList() ?? [],
        limit: json["limit"] ?? 0,
        page: json["page"] ?? 0,
        totalRecords: json["total_records"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        nextPageLink: json["next_page_link"] ?? "",
        previousPageLink: json["previous_page_link"] ?? "",
      );
}
