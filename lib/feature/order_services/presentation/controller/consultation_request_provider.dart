import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/domin/use_case/order_services_use_case.dart';
import 'package:bacura_app/feature/order_services/presentation/components/request_sent_bottomsheet.dart';

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
    ));
    result.fold((l) async {
      showOrderSentBottomSheet(
        context: context,
        title: tr(AppStrings.errorOccurredPleaseTryAgainLater),
        imagePath: AppAssets.badFeedback,
      );
    }, (r) async {
      showOrderSentBottomSheet(
        context: context,
        title: tr(AppStrings.weHaveSentTheRequest),
        imagePath: AppAssets.request,
      );
      descriptionController.clear();
    });
  }

  void showOrderSentBottomSheet({
    required BuildContext context,
    required String imagePath,
    required String title,
  }) {
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
