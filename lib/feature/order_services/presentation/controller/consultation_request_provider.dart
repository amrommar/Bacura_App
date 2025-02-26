import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/order_services/presentation/components/request_sent_bottomsheet.dart';

class ConsultationRequestProvider extends ChangeNotifier {
  String selectedOption = 'استشارة تقنية';
  var descriptionController = TextEditingController();
  int selectedServiceIndex = 0;

  ConsultationRequestProvider();

  void sendOrderRequest({int? serviceId, required int categoryId, required BuildContext context}) async {
    var result = await sl<OrderServicesUseCase>().call(OrderServicesParams(
      description: descriptionController.text,
      serviceId: serviceId,
      categoryId: categoryId,
    ));
    result.fold((l) async {
      showOrderSentBottomSheet(
          context: context,
          title: 'لقد حدث خطاء، يرجى المحاولة لاحقا',
          imagePath: 'assets/images/png/bad-feedback.png');
    }, (r) async {
      showOrderSentBottomSheet(
          context: context,
          title: 'لقد أرسلنا الطلب، وسيقوم مزود الخدمة بالتواصل معك.',
          imagePath: 'assets/images/png/request.png');
      descriptionController.clear();
    });
  }

  void showOrderSentBottomSheet({required BuildContext context, required String imagePath, required String title}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return OrderSentBottomSheet(
            image: imagePath,
            title: title,
          );
        });
  }
}
