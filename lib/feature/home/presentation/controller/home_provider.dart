import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';
import 'package:bacura_app/feature/home/domain/use_case/get_banner_use_case.dart';
import 'package:bacura_app/feature/home/domain/use_case/get_category_use_case.dart';
import 'package:bacura_app/feature/home/domain/use_case/on_banner_clicked_use_case.dart';

class HomeProvider with ChangeNotifier {
  late List<BannerEntity> bannerEntity;
  late List<CategoryEntity> categoryEntity;
  String? selectedService;
  bool isSliderLoading = true;
  bool isCategoryLoading = true;

  HomeProvider() {
    _getBanner();
    _getCategories();
  }

  Future<void> _getBanner() async {
    var res = await sl<GetBannerUseCase>().call();
    await res.fold((l) async {}, (r) {
      bannerEntity = r;
      isSliderLoading = false;
      notifyListeners();
    });
  }

  Future<void> onBannerClicked({required int id}) async {
    await sl<OnBannerClickedUseCase>().call(id);
  }

  Future<void> _getCategories() async {
    var res = await sl<GetCategoryUseCase>().call();
    res.fold((l) async {}, (r) async {
      categoryEntity = r;
      isCategoryLoading = false;
      notifyListeners();
    });
  }

  void goToServiceScreen(BuildContext context, CategoryEntity category) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServiceTypeScreen(
                  categoryEntity: category,
                )));
  }
}
