import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/get_my_orders_use_case.dart';

class MyOrderProvider with ChangeNotifier {
  late MyOrderEntity myOrderEntity;
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingMyOrders = true;
  int pageNumber = 1;
  List<String> _selectedFilters = [];

  List<String> get selectedFilters => _selectedFilters;

  MyOrderProvider() {
    init();
  }

  init() async {
    await _getMyOrders();
  }

  Future<void> _getMyOrders({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();
    (await sl<GetMyOrdersUseCase>()(
      MyOrdersParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    ))
        .fold((l) async {
      //! handle in error
    }, (r) {
      if (r.myOrderDataEntity.isEmpty) {
        isFinishedPaging = true;
      } else if (isLoadingMore) {
        myOrderEntity.myOrderDataEntity.addAll(r.myOrderDataEntity);
      } else {
        myOrderEntity = r;
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

  void setSelectedFilters(List<String> filters) {
    _selectedFilters = filters;
    notifyListeners();
  }

  List<MyOrderDataEntity> get filteredOrders {
    if (_selectedFilters.isEmpty) {
      return myOrderEntity.myOrderDataEntity;
    }
    return myOrderEntity.myOrderDataEntity.where((request) {
      return _selectedFilters.contains(request.status);
    }).toList();
  }

  String dateCreateOrder(int index) {
    var requestEntity = filteredOrders[index];
    String fullDateTime = requestEntity.createdAt!;
    String dateOnly = fullDateTime.split("T")[0];
    return dateOnly;
  }
}
