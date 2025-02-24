import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endpoint.dart';
import 'package:bacura_app/feature/offers/data/model/items_offer_model.dart';
import 'package:bacura_app/feature/offers/data/model/offer_model.dart';
import 'package:bacura_app/feature/offers/domain/entity/items_offer_entity.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domain/use_case/get_my_offers_use_case.dart';

abstract class BaseOffersDataSource {
  Future<OffersEntity> getOffers({required OffersParameters offersParameters});
  Future<List<ItemsOfferEntity>> getItems({required int id});
}

class OffersDataSource extends BaseOffersDataSource {
  @override
  Future<OffersEntity> getOffers({required OffersParameters offersParameters}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: ApiEndPoint.offersPath,
        queryParameters: offersParameters.toMap(),
      );

      if (response != null) {
        final data = response.data;

        if (data is Map<String, dynamic>) {
          return MyOffersModel.fromJson(data);
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
  Future<List<ItemsOfferEntity>> getItems({required int id}) async {
    try {
      final response = await ApiClient().apiCall(
        requestType: RequestType.GET,
        url: 'offers/$id/items',
      );

      if (response?.data is Map<String, dynamic>) {
        var data = response?.data['data'];
        if (data is List) {
          return data.map((e) => ItemsOfferModel.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print("Error fetching items: $e");
    }

    return [];
  }
}
