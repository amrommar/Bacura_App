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

  void sendOrderRequest({required int categoryId, required BuildContext context}) async {
    var result = await sl<OrderServicesUseCase>().call(OrderServicesParams(
      location: locationController.text,
      date: formattedDate,
      time: selectedOption,
      description: descriptionController.text,
      serviceId: 16,
      categoryId: categoryId,
      longitude: longitude,
      latitude: latitude,
    ));
    result.fold((l) async {
      showOrderSentBottomSheet(
          context: context,
          message: 'لقد حدث خطاء، يرجى المحاولة لاحقا',
          imgPath: 'assets/images/png/bad-feedback.png');
    }, (r) async {
      showOrderSentBottomSheet(
          context: context,
          message: 'لقد أرسلنا الطلب، وسيقوم مزود الخدمة بالتواصل معك.',
          imgPath: 'assets/images/png/request.png');
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

  void showOrderSentBottomSheet({required BuildContext context, required String message, required String imgPath}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return OrderSentBottomSheet(
            image: imagePath,
            title: message,
          );
        });
  }
}
