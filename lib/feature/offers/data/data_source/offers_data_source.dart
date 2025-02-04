import 'package:bacura_app/core/network/model/api_client.dart';
import 'package:bacura_app/core/network/model/api_endoint.dart';

import 'package:bacura_app/feature/offers/data/model/offer_model.dart';
import 'package:bacura_app/feature/offers/domin/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domin/use_case/get_my_requests_use_case.dart';

abstract class BaseOffersDataSource {
  Future<OffersEntity> getOffers({required OffersParameters offersParameters});
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
}
