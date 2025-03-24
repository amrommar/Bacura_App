import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/my_order_data_entity.dart';
import 'package:bacura_app/feature/technician_app/profile/domain/use_case/get_orders_calender_use_case.dart';
import 'package:intl/intl.dart';

class CalenderOrdersProvider extends ChangeNotifier {
  List<MyOrderDataEntity> orders = [];
  bool isLoadingMyOrders = true;
  String selectedDate = '';

  CalenderOrdersProvider() {
    _getMyOrders();
  }

  Future<void> _getMyOrders() async {
    if (selectedDate.isEmpty) return;

    DateTime selectedDateTime = DateTime.parse(selectedDate);
    DateTime nextDaySelected = selectedDateTime.add(Duration(days: 1));

    final result = await sl<GetOrdersCalenderUseCase>()(
      MyOrdersCalenderParameter(
          from: DateFormat('yyyy-MM-dd').format(selectedDateTime),
          to: DateFormat('yyyy-MM-dd').format(nextDaySelected)),
    );

    result.fold((l) async {
      //! handle in error
    }, (r) {
      orders = r;
      isLoadingMyOrders = false;
      notifyListeners();
    });
  }

  void setSelectedDate(String date) {
    selectedDate = date;
    _getMyOrders();
  }
}
