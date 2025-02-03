import 'package:bacura_app/core/utils/dialig_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/domain/usecases/suggetions_use_case.dart';

class SuggestionsProvider extends ChangeNotifier {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var suggestionsController = TextEditingController();

  void sendSuggestions(BuildContext context) {
    sl<SuggestionsUseCase>().call(SuggestionsParameter(
      name: nameController.text,
      email: emailController.text,
      phone: mobileNumberController.text,
      suggestion: suggestionsController.text,
    ));
    customShowCustomDialog(
        context: context,
        title: 'تم ارسال اقتراحك بنجاحك',
        imagePath: 'assets/images/png/checked.png',
        content: 'يهمنا إهتمامك ونشكرك علي اقتراحك',
        isOk: true,
        isCancel: false,
        onCancel: () {},
        onOk: () async {
          Navigator.pushNamed(context, Routes.homeRoute);
        });
  }
}
