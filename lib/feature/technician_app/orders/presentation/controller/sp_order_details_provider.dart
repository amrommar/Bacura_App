import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/items_for_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/items_for_order_use_case.dart';

class SpOrderDetailsProvider extends ChangeNotifier {
  late List<ItemsForOrderEntity?> itemsForOrderEntity;
  bool isItemsLoading = true;
  int id;

  SpOrderDetailsProvider({required this.id}) {
    _getItemsForOrders();
  }

  Future<void> _getItemsForOrders() async {
    notifyListeners();
    (await sl<ItemsForOrderUseCase>()(
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
}
