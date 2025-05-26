import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/completed_orders_use_case.dart';

class CompletedOrdersProvider extends ChangeNotifier {
  MyOrderEntity myOrderEntity = MyOrderEntity(
    myOrderDataEntity: [],
    limit: 0,
    page: 1,
    totalRecords: 0,
    totalPages: 0,
    nextPageLink: '',
    previousPageLink: '',
  );
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingMyOrders = true;
  int pageNumber = 1;
  List<String> _selectedFilters = [];

  List<String> get selectedFilters => _selectedFilters;

  CompletedOrdersProvider() {
    init();
  }

  init() async {
    await _getMyOrders();
  }

  Future<void> _getMyOrders({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();

    final result = await sl<GetCompletedOrdersUseCase>()(
      MyCompletedOrdersParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    );

    result.fold((l) async {
      //! handle in error
    }, (r) {
      if (r.myOrderDataEntity.isEmpty) {
        isFinishedPaging = true;
      } else {
        if (isLoadingMore) {
          myOrderEntity = myOrderEntity.copyWith(
            myOrderDataEntity: [
              ...myOrderEntity.myOrderDataEntity,
              ...r.myOrderDataEntity,
            ],
          );
        } else {
          myOrderEntity = r;
        }
      }

      isLoadingMore = false;
      isLoadingMyOrders = false;
      notifyListeners();
    });
  }

  loadMoreMyOrders() async {
    if (isFinishedPaging) return;
    pageNumber++;
    isLoadingMore = true;
    notifyListeners();
    await _getMyOrders(isLoadingMore: true);
    isLoadingMore = false;
    notifyListeners();
  }
}
