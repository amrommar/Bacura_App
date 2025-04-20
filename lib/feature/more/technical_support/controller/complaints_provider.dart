import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/domain/usecases/complaints_use_case.dart';

class ComplaintsProvider extends ChangeNotifier {
  var complaintController = TextEditingController();
  String selectedOption = tr(AppStrings.serviceProvider);

  void sendComplaints(BuildContext context) {
    sl<ComplaintsUseCase>().call(ComplaintsParameter(
      type: selectedOption,
      complaint: complaintController.text,
    ));
    customShowCustomDialog(
        context: context,
        title: tr(AppStrings.yourContactRequestSentSuccessfully),
        imagePath: AppAssets.checkedIcon,
        content: tr(AppStrings.yourContactRequestSentSuccessfully),
        isOk: true,
        isCancel: false,
        onCancel: () {},
        onOk: () async {
          Navigator.pushNamed(context, Routes.homeRoute);
        });
  }
}
