import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/order_services/presentation/components/request_sent_bottomsheet.dart';
import 'package:bacura_app/feature/order_services/presentation/components/set_location_bottom_sheet.dart';
import 'package:intl/intl.dart';

class OrderServicesProvider extends ChangeNotifier {
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  double latitude = 0.0;
  double longitude = 0.0;
  String selectedOption = tr(AppStrings.time9_1);
  DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(
    DateTime.now(),
  );
  final List<String> options = [
    tr(AppStrings.time9_1),
    tr(AppStrings.time1_6),
  ];

  OrderServicesProvider();

  dynamic onTimeChanged(String value) {
    selectedOption = value;
    notifyListeners();
  }

  void onDateChanged(DateTime value) {
    selectedDate = value;
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    notifyListeners();
  }

  void sendOrderRequest(
    int? serviceId,
    int? categoryId, {
    required BuildContext context,
  }) async {
    var res = await sl<OrderServicesUseCase>().call(OrderServicesParams(
      location: locationController.text,
      date: formattedDate,
      // ! handle from back end
      time: selectedOption,
      description: descriptionController.text,
      serviceId: serviceId!,
      categoryId: categoryId!,
      longitude: longitude,
      latitude: latitude,
    ));

    res.fold((l) {
      showOrderSentBottomSheet(
        context: context,
        message: tr(AppStrings.errorOccurredPleaseTryAgainLater),
        imgPath: AppAssets.badFeedback,
      );
    }, (r) {
      showOrderSentBottomSheet(
        context: context,
        message: tr(AppStrings.weHaveSentTheRequest),
        imgPath: AppAssets.request,
      );
      locationController.clear();
      descriptionController.clear();
    });
  }

  void showLocationBottomSheet({required BuildContext context}) async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        return SetLocationBottomSheet(
          locationController: locationController,
          latitude: latitude,
          longitude: longitude,
        );
      },
    );

    if (result != null) {
      latitude = result['latitude'];
      longitude = result['longitude'];
      locationController.text = result['address'];
      notifyListeners();
    }
  }

  void showOrderSentBottomSheet({
    required BuildContext context,
    required String message,
    required String imgPath,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return OrderSentBottomSheet(
            title: message,
          );
        });
  }
}
