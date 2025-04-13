import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/order_services/presentation/components/request_sent_bottomsheet.dart';
import 'package:intl/intl.dart';

class ConsultationRequestProvider extends ChangeNotifier {
  String selectedOption = tr(AppStrings.selectConsultationType);
  var descriptionController = TextEditingController();
  int selectedServiceIndex = 0;

  ConsultationRequestProvider();

  void sendOrderRequest({
    int? serviceId,
    required int categoryId,
    required BuildContext context,
  }) async {
    var result = await sl<OrderServicesUseCase>().call(OrderServicesParams(
      description: descriptionController.text,
      serviceId: serviceId,
      categoryId: categoryId,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    ));
    result.fold((l) async {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return OrderSentBottomSheet(
              title: tr(AppStrings.errorOccurredPleaseTryAgainLater),
            );
          });
    }, (r) async {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return OrderSentBottomSheet(
              title: tr(AppStrings.weHaveSentTheRequest),
            );
          });

      descriptionController.clear();
    });
  }
}
