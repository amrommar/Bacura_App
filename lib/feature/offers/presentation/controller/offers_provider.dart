import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/domin/entity/offers_data_entity.dart';
import 'package:bacura_app/feature/offers/domin/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domin/use_case/get_my_requests_use_case.dart';
import 'package:intl/intl.dart';

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

  List<OffersDataEntity> get filteredRequests {
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

    return "باقي ${NumberParser.translateNumber(difference.inDays.toString())} يوم";
  }
}
