import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/order_services/presentation/components/request_sent_bottomsheet.dart';
import 'package:bacura_app/feature/order_services/presentation/components/set_location_bottom_sheet.dart';
import 'package:intl/intl.dart';

class OrderServicesProvider extends ChangeNotifier {
  TextEditingController locationController = TextEditingController();
  double latitude = 0.0;
  double longitude = 0.0;
  TextEditingController descriptionController = TextEditingController();
  String selectedOption = '9 ص - 1 م';
  DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final List<String> options = ['9 ص - 1 م', '1 م - 6 م'];

  OrderServicesProvider();

  dynamic onTimeChanged(String value) {
    selectedOption = value;
    notifyListeners();
  }

  void onDateChanged(DateTime value) {
    selectedDate = value;
    formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
    print('Formatted Date: $formattedDate'); // Check output
    notifyListeners();
  }

  void sendOrderRequest(int? serviceId, int? categoryId) async {
    sl<OrderServicesUseCase>().call(OrderServicesParams(
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
    print('locationController: ${locationController.text}');
    print('descriptionController: ${descriptionController.text}');
    print('selectedOption: $selectedOption');
    print('selectedDate: $formattedDate');
    print('latitude: $latitude');
    print('longitude: $longitude');
    print('serviceId: $serviceId');
    print('categoryId: $categoryId');
  }

  void showLocationBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const SetLocationBottomSheet();
        });
  }

  void showordersentBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ordersentBottomSheet();
        });
  }
}
