import 'package:bacura_app/core/presentation/widget/custom_dialog_services.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';
import 'package:bacura_app/feature/home/domain/use_case/get_banner_use_case.dart';
import 'package:get/get.dart';

class HomeProvider with ChangeNotifier {
  late List<BannerEntity> bannerEntity;

  HomeProvider() {
    _getBanner();
  }

  Future<void> _getBanner() async {
    var res = await sl<GetBannerUseCase>().call();
    await res.fold((l) async {}, (r) {
      bannerEntity = r;
    });
  }
}
