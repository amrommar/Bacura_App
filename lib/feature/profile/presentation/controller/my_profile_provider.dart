import 'package:bacura_app/core/presentation/widget/custom_dialog_services.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/domain/entity/my_profile_entity.dart';
import 'package:bacura_app/feature/profile/domain/use_case/my_profile_use_case.dart';
import 'package:get/get.dart';

class MyProfileProvider with ChangeNotifier {
  MyProfileEntity myProfileEntity = const MyProfileEntity(
    name: '',
    email: '',
    phone: '',
    gender: '',
    location: '',
  );
  bool isLoading = true;
  String? completePhoneNumber;
  File? selectedImage;

  var mobileNumberController = TextEditingController();

  var emailController = TextEditingController();
  final List<String> genderOptions = ['ذكر', 'أنثي'];
  final List<String> cityOptions = ['الرياض', 'جده', 'مكة', 'الدمام'];
  final ImagePicker _picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  MyProfileProvider() {
    init();
  }

  init() async {
    await _getMyProfile();
  }

  Future<void> _getMyProfile() async {
    var result = await sl<MyProfileUseCase>().call();
    result.fold((l) async {
      await DialogWidget.showCustomDialog(context: Get.context!, message: l.message);
    }, (r) async {
      myProfileEntity = r;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> pickImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(AppLocalizations.of(context)!.take_picture),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    selectedImage = File(pickedFile.path);
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text(AppLocalizations.of(context)!.choose_from_gallery),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    selectedImage = File(pickedFile.path);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
