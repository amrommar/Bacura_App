import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_data_entity.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domain/use_case/get_my_offers_use_case.dart';

class OffersProvider with ChangeNotifier {
  late OffersEntity offersEntity;
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingOffers = true;
  int pageNumber = 1;
  List<int> _selectedFilters = [];

  List<int> get selectedFilters => _selectedFilters;

  OffersProvider() {
    init();
  }

  init() async {
    await getOffers();
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

  void setSelectedFilters(List<int> filters) {
    _selectedFilters = filters;
    notifyListeners();
  }

  List<OffersDataEntity> get filteredorders {
    if (_selectedFilters.isEmpty) {
      return offersEntity.offersDataEntity;
    }
    return offersEntity.offersDataEntity.where((request) {
      return _selectedFilters.contains(request.categoryId);
    }).toList();
  }

  String getRemainingDays(int index) {
    DateTime? targetDate = DateParser.convertUTCStringToLocalTime(offersEntity.offersDataEntity[index].expiresAt!);
    if (targetDate == null) return "تاريخ غير صالح";

    Duration difference = targetDate.difference(DateTime.now());

    int remainingDays = difference.inDays;
    if (difference.inSeconds > 0) {
      remainingDays += 1;
    }

    return "باقي ${NumberParser.translateNumber(remainingDays.toString())} يوم";
  }
}
