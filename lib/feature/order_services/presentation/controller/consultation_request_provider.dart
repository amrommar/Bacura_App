import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/order_services/presentation/components/request_sent_bottomsheet.dart';

class ConsultationRequestProvider extends ChangeNotifier {
  String selectedOption = 'استشارة تقنية';
  var descriptionController = TextEditingController();

  void sendOrderRequest({int? serviceId, int? categoryId}) async {
    sl<OrderServicesUseCase>().call(OrderServicesParams(
      description: descriptionController.text,
    ));
  }

  void showOrderSentBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const orderSentBottomSheet();
        });
  }
}
