import 'package:bacura_app/core/services/date_parser.dart';
import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_data_entity.dart';
import 'package:bacura_app/feature/offers/domain/entity/offers_entity.dart';
import 'package:bacura_app/feature/offers/domain/use_case/get_my_offers_use_case.dart';

class OffersProvider with ChangeNotifier {
  OffersEntity offersEntity = const OffersEntity(
    offersDataEntity: [],
    limit: 10,
    page: 1,
    totalRecords: 0,
    totalPages: 0,
    nextPageLink: null,
    previousPageLink: null,
  );
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

    final result = await sl<GetOffersUseCase>()(
      OffersParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    );

    result.fold((l) async {
      //! handle in error
    }, (r) {
      if (r.offersDataEntity.isEmpty) {
        isFinishedPaging = true;
      } else {
        if (isLoadingMore) {
          offersEntity = offersEntity.copyWith(
            offersDataEntity: [
              ...offersEntity.offersDataEntity,
              ...r.offersDataEntity,
            ],
          );
        } else {
          offersEntity = r;
        }
      }
      isLoadingOffers = false;
      this.isLoadingMore = false;
      notifyListeners();
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
