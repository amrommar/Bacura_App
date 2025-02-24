import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/domain/entity/items_offer_entity.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domain/use_case/get_items_for_offer__use_case.dart';
import 'package:bacura_app/feature/offers/domain/use_case/get_my_offers_use_case.dart';

class OffersDetailsProvider extends ChangeNotifier {
  final int id;

  late List<ItemsOfferEntity?> itemsForOrderEntity;
  late OffersEntity offersEntity;
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingOffers = true;
  bool isItemsLoading = true;
  int pageNumber = 1;

  OffersDetailsProvider({required this.id}) {
    init();
  }

  Future<void> init() async {
    await _getItemsForOrders();
    await getOffers();
  }

  Future<void> _getItemsForOrders() async {
    notifyListeners();
    (await sl<GetItemsForOfferUseCase>()(
      id,
    ))
        .fold((l) async {
      //! handle in error
    }, (r) {
      //! handle in success
      itemsForOrderEntity = r;
      isItemsLoading = false;
      notifyListeners();
    });
  }

  Future<void> getOffers({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();
    (await sl<GetOffersUseCase>()(
      OffersParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    ))
        .fold((l) async {
      //! handle in error
    }, (r) {
      if (r.offersDataEntity.isEmpty) {
        offersEntity = r;
        isFinishedPaging = true;
        isLoadingOffers = false;
        notifyListeners();
      } else if (isLoadingMore) {
        offersEntity.offersDataEntity.addAll(r.offersDataEntity);
        this.isLoadingMore = false;
        notifyListeners();
      } else {
        offersEntity = r;
        isLoadingOffers = false;
        notifyListeners();
      }
    });
  }

  loadMoreOffers() async {
    if (isFinishedPaging) return;
    pageNumber++;
    isLoadingMore = true;
    notifyListeners();
    await getOffers(isLoadingMore: true);
    isLoadingMore = false;
    notifyListeners();
  }
}
