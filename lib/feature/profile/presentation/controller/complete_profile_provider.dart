import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/domain/usecases/complete_profile_use_case.dart';

class CompleteProfileProvider with ChangeNotifier {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  String selectedGender = '';
  String selectedLocation = '';

  completeProfile() async {
    await sl<CompleteProfileUseCase>()
        .call(CompleteParameter(email: emailController.text, fullName: nameController.text, gender: selectedGender, location: selectedLocation));
  }
}
