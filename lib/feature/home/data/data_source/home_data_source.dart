import 'package:bacura_app/core/network/model/api_response.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/data/model/banner_model.dart';
import 'package:bacura_app/feature/home/data/model/category_model.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';

abstract class BaseHomeDataSource {
  Future<List<BannerEntity>> getBanner();
  Future<void> onBannerClicked({required String id});
  Future<List<CategoryEntity>> getCategories();
}

class HomeDataSource extends BaseHomeDataSource {
  @override
  Future<List<BannerEntity>> getBanner() async {
    var response = await ApiClient().apiCall(
      requestType: RequestType.GET,
      url: ApiEndPoint.bannerPath,
    );

    if (response?.data is Map<String, dynamic>) {
      var data = response?.data['data'];
      if (data is List) {
        return data.map((e) => BannerModel.fromJson(e)).toList();
      }
    }

    throw Exception("Unexpected response structure: ${response?.data}");
  }

  @override
  Future<void> onBannerClicked({required String id}) async {
    await ApiClient().apiCall(
      requestType: RequestType.GET,
      url: 'banners/$id/click',
    );
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    var response = await ApiClient().apiCall(
      requestType: RequestType.GET,
      url: ApiEndPoint.categoriesPath,
    );

    if (response?.data is Map<String, dynamic>) {
      var data = response?.data['data'];
      if (data is List) {
        return data.map((e) => CategoryModel.fromJson(e)).toList();
      }
    }

    throw Exception("Unexpected response structure: ${response?.data}");
  }
}
