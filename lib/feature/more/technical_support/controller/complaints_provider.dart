import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/domain/usecases/complaints_use_case.dart';

class ComplaintsProvider extends ChangeNotifier {
  var complaintController = TextEditingController();
  String selectedOption = 'مقدم الخدمة';

  void sendComplaints(BuildContext context) {
    sl<ComplaintsUseCase>().call(ComplaintsParameter(
      type: selectedOption,
      complaint: complaintController.text,
    ));
    customShowCustomDialog(
        context: context,
        title: AppStrings.yourComplaintSentSuccessfully,
        imagePath: AppAssets.checkedIcon,
        content: AppStrings.yourComplaintSentSuccessfully,
        isOk: true,
        isCancel: false,
        onCancel: () {},
        onOk: () async {
          Navigator.pushNamed(context, Routes.homeRoute);
        });
  }
}
