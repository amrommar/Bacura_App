import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_orders/domain/entity/items_for_order_entity.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/cancel_order_use_case.dart';
import 'package:bacura_app/feature/my_orders/domain/use_case/items_for_order_use_case.dart';
import 'package:flutter/material.dart';

class SpOrderDetailsProvider extends ChangeNotifier {
  late List<ItemsForOrderEntity?> itemsForOrderEntity;
  bool isItemsLoading = true;
  int id;
  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;

  // States for phases
  bool phase1Completed = true;
  bool phase2Completed = true;
  bool phase3Completed = false;

  // Button text
  String _buttonText = 'تم التنفيذ';
  String get buttonText => _buttonText;

  SpOrderDetailsProvider({required this.id}) {
    _getItemsForOrders();
  }

  Future<void> _getItemsForOrders() async {
    notifyListeners();
    (await sl<ItemsForOrderUseCase>()(id)).fold(
      (l) async {
        // Handle error
      },
      (r) {
        itemsForOrderEntity = r;
        isItemsLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> cancelOrder({
    required BuildContext context,
  }) async {
    final result = await sl<CancelOrderUseCase>()(
      CancelOrderParameter(status: 'completed', id: id),
    );

    result.fold(
      (l) {
        customShowCustomDialog(
          context: context,
          title: tr(AppStrings.errorOccurred),
          imagePath: AppAssets.badFeedback,
          content: tr(AppStrings.pleaseTryAgain),
          isOk: true,
          isCancel: false,
          onOk: () => Navigator.pop(context),
          onCancel: () {},
        );
      },
      (r) {
        _isCompleted = true;
        notifyListeners();

        customShowCustomDialog(
          context: context,
          title: tr(AppStrings.orderCancelledSuccessfully),
          imagePath: AppAssets.checkedIcon,
          content: tr(AppStrings.orderCancelledAndIfProblem),
          isOk: true,
          isCancel: false,
          onOk: () => Navigator.pop(context),
          onCancel: () {},
        );
      },
    );
  }
}
