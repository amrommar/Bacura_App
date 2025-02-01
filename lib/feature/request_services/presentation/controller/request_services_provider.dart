import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/request_services/domin/use_case/request_services_use_case.dart';
import 'package:bacura_app/feature/request_services/presentation/components/request_sent_bottomsheet.dart';
import 'package:bacura_app/feature/request_services/presentation/components/set_location_bottom_sheet.dart';
import 'package:intl/intl.dart';

class RequestServicesProvider extends ChangeNotifier {
  var locationController = TextEditingController();
  double latitude = 0.0;
  double longitude = 0.0;
  var descriptionController = TextEditingController();
  String selectedOption = '9 ص - 1 م';
  DateTime selectedDate = DateTime.now();
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final List<String> options = ['9 ص - 1 م', '1 م - 6 م'];

  dynamic onTimeChanged(String value) {
    selectedOption = value;
    notifyListeners();
  }

  void onDateChanged(DateTime value) {
    selectedDate = value;
    formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
    notifyListeners();
  }

  void sendOrderRequest() {
    // sl<RequestServicesUseCase>().call(RequestServicesParams(
    //   location: locationController.text,
    //   date: formattedDate,
    //   time: selectedOption,
    //   description: descriptionController.text,
    //   serviceId: 1,
    //   categoryId: 1,
    //   longitude: longitude,
    //   latitude: latitude,
    // ));
    print('locationController: ${locationController.text}');
    print('descriptionController: ${descriptionController.text}');
    print('selectedOption: $selectedOption');
    print('selectedDate: $formattedDate');
    print('latitude: $latitude');
    print('longitude: $longitude');
  }

  void showLocationBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const SetLocationBottomSheet();
        });
  }

  void showRequestSentBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const RequestSentBottomSheet();
        });
  }
}
