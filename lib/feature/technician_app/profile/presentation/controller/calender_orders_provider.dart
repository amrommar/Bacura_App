import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/get_orders_calender_use_case.dart';

class CalenderOrdersProvider extends ChangeNotifier {
  List<MyOrderDataEntity> orders = [];
  bool isLoadingMyOrders = true;

  CalenderOrdersProvider() {
    _getMyOrders();
  }

  Future<void> _getMyOrders() async {
    final result = await sl<GetOrdersCalenderUseCase>()(
      MyOrdersCalenderParameter(from: '2025-3-23', to: '2025-3-25'),
    );

    result.fold((l) async {
      //! handle in error
    }, (r) {
      orders = r;
      isLoadingMyOrders = false;
      notifyListeners();
    });
  }
}
