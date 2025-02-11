import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/order_services/presentation/components/request_sent_bottomsheet.dart';
import 'package:bacura_app/feature/order_services/presentation/components/set_location_bottom_sheet.dart';
import 'package:intl/intl.dart';

class CinemaOrderProvider with ChangeNotifier {
  TextEditingController locationController = TextEditingController();
  double latitude = 0.0;
  double longitude = 0.0;
  TextEditingController descriptionController = TextEditingController();
  String selectedOption = '9 ص - 1 م';
  DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final List<String> options = ['9 ص - 1 م', '1 م - 6 م'];

  dynamic onTimeChanged(String value) {
    selectedOption = value;
    notifyListeners();
  }

  void onDateChanged(DateTime value) {
    selectedDate = value;
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    notifyListeners();
  }

  void sendOrderRequest({required int categoryId}) async {
    sl<OrderServicesUseCase>().call(OrderServicesParams(
      location: locationController.text,
      date: formattedDate,
      time: selectedOption,
      description: descriptionController.text,
      categoryId: categoryId,
      longitude: longitude,
      latitude: latitude,
    ));
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

  void showOrderSentBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const orderSentBottomSheet();
        });
  }
}
