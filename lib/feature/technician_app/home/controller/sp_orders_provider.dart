import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/get_my_orders_use_case.dart';

class SpOrdersProvider extends ChangeNotifier {
  late MyOrderEntity myOrderEntity = MyOrderEntity(
    myOrderDataEntity: [],
    limit: 0,
    page: 0,
    totalRecords: 0,
    totalPages: 0,
    nextPageLink: "",
    previousPageLink: "",
  );
  bool isLoadingMore = false;
  bool isFinishedPaging = false;
  bool isLoadingMyOrders = true;
  int pageNumber = 1;

  SpOrdersProvider() {
    getMyOrders();
  }

  onRefresh() async {
    pageNumber = 1;
    isLoadingMyOrders = true;
    notifyListeners();
    await getMyOrders();
    isLoadingMyOrders = false;
    notifyListeners();
  }

  Future<void> getMyOrders({bool isLoadingMore = false}) async {
    this.isLoadingMore = isLoadingMore;
    notifyListeners();

    final result = await sl<GetMyOrdersUseCase>()(
      MyOrdersParameters(page: pageNumber, limit: AppConstants.defaultPageSize),
    );

    result.fold((l) async {
      isLoadingMyOrders = false;
      notifyListeners();
    }, (r) {
      final filteredOrders = r.myOrderDataEntity.where((order) => order.status != "completed").toList();

      if (isLoadingMore) {
        myOrderEntity = myOrderEntity.copyWith(
          myOrderDataEntity: [
            ...myOrderEntity.myOrderDataEntity,
            ...filteredOrders,
          ],
        );
      } else {
        myOrderEntity = myOrderEntity.copyWith(
          myOrderDataEntity: filteredOrders,
        );
      }

      // يجب إيقاف التحميل حتى لو لم تكن هناك بيانات
      isLoadingMore = false;
      isLoadingMyOrders = false;
      isFinishedPaging = filteredOrders.isEmpty; // تحديد إذا كان التحميل انتهى
      notifyListeners();
    });
  }

  loadMoreMyOrders() async {
    if (isFinishedPaging) return;
    pageNumber++;
    isLoadingMore = true;
    notifyListeners();
    await getMyOrders(isLoadingMore: true);
    isLoadingMore = false;
    notifyListeners();
  }

  String dateCreateOrder(int index) {
    var requestEntity = myOrderEntity.myOrderDataEntity[index];
    String fullDateTime = requestEntity.installationDate!;
    String dateOnly = fullDateTime.split("T")[0];
    return dateOnly;
  }
}
