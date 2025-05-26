import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/customer_service/domain/entity/chat_entity.dart';
import 'package:bacura_app/feature/customer_service/domain/use_case/get_my_chat_use_case.dart';
import 'package:bacura_app/feature/home/domain/entity/Category_entity.dart';
import 'package:bacura_app/feature/home/domain/entity/banner_entity.dart';
import 'package:bacura_app/feature/home/domain/use_case/get_banner_use_case.dart';
import 'package:bacura_app/feature/home/domain/use_case/get_category_use_case.dart';
import 'package:bacura_app/feature/home/domain/use_case/on_banner_clicked_use_case.dart';
import 'package:bacura_app/feature/notifications/domain/use_case/get_unread_notifications_use_case.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class HomeProvider with ChangeNotifier {
  late List<BannerEntity> bannerEntity;
  late List<CategoryEntity> categoryEntity;
  int? selectedServiceIndex;
  bool isSliderLoading = true;
  bool isCategoryLoading = true;
  int currentIndex = 0;
  int notificationCount = 0;
  late ChatEntity getMessagesChat;
  bool isLoading = true;

  HomeProvider(context) {
    init();
    Provider.of<MyProfileProvider>(context, listen: false).init();
  }

  void init() async {
    await _getCategories();
    await _getMine();
    await _getBanner();
    await _getNotificationCount();
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

  void navigateOnBannerClicked({required int id, required BuildContext context, required int index}) {
    if (id == 0) return;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OfferDetailsScreen(
                  id: id,
                  index: index,
                )));
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

  void onSelectService(int index) {
    selectedServiceIndex = index;
    notifyListeners();
  }

  _getNotificationCount() async {
    var res = await sl<GetUnreadNotificationsUseCase>().call();

    res.fold((l) => null, (r) {
      notificationCount = r;
      notifyListeners();
    });
  }

  Future<void> _getMine() async {
    var result = await sl<GetMyChatUseCase>().call();
    result.fold((l) async {}, (r) async {
      getMessagesChat = r;
      isLoading = false;
      notifyListeners();
    });
  }
}
