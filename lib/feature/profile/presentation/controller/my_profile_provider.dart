import 'package:bacura_app/core/presentation/widget/custom_dialog_services.dart';
import 'package:bacura_app/core/presentation/widget/custom_modal_bottom_sheet.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/presentation/views/components/verify_screen.dart';
import 'package:bacura_app/feature/profile/domain/entity/my_profile_entity.dart';
import 'package:bacura_app/feature/profile/domain/use_case/my_profile_use_case.dart';
import 'package:bacura_app/feature/profile/domain/use_case/update_profile_use_case.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/edit_data_bottom_sheet.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/edit_email_bottom_sheet.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/edit_gender_bottom_sheet.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/edit_location_bottom_sheet.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/edit_name_bottom_sheet.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/edit_phone_number_bottom_sheet.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

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

  String? selectedGender;
  String? selectedCity;
  bool isImagePickerOpen = false;
  File? imagePath;

  final BuildContext context;

  final List<String> genderOptions = ['ذكر', 'أنثي'];
  final List<String> cityOptions = ['الرياض', 'جده', 'مكة', 'الدمام'];
  final TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey countryPickerWidgetKey = GlobalKey();
  double? textFieldHeight;

  MyProfileProvider(this.context) {
    init();
  }

  init() async {
    await _getMyProfile();
  }

  getTextFieldHeight() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      textFieldHeight = countryPickerWidgetKey.currentContext?.size?.height ?? AppSizes.ph45;
      notifyListeners();
    });
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

  Future<void> updateMyProfile() async {
    isLoading = true;
    notifyListeners();
    await sl<UpdateProfileUseCase>().call(UpdateProfileParameters(
      name: myProfileEntity.name == nameController.text ? null : nameController.text,
      email: myProfileEntity.email == emailController.text ? null : emailController.text,
      phone: myProfileEntity.phone == completePhoneNumber ? null : completePhoneNumber,
      gender: myProfileEntity.gender == selectedGender ? null : selectedGender,
      location: myProfileEntity.location == selectedCity ? null : selectedCity,
      image: imagePath,
    ));
    isLoading = false;
    _getMyProfile();
    notifyListeners();
  }

  Future<void> pickImage(BuildContext context) async {
    isImagePickerOpen = true;
    final ImagePicker picker = ImagePicker();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('اختر مصدر الصورة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('الكاميرا'),
                onTap: () async {
                  Navigator.of(dialogContext).pop();
                  await _pickImageFromSource(ImageSource.camera, picker);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('المعرض'),
                onTap: () async {
                  Navigator.of(dialogContext).pop();
                  await _pickImageFromSource(ImageSource.gallery, picker);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromSource(ImageSource source, ImagePicker picker) async {
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final Uint8List imageBytes = await convertXFileToUint8List(pickedFile);
      imagePath = await convertUnit8ListToFile(imageInUnit8List: imageBytes);

      await sl<UpdateProfileUseCase>().call(UpdateProfileParameters(
        image: imagePath,
      ));
    }
    isImagePickerOpen = false;
    notifyListeners();
    _getMyProfile();
  }

  Future<void> openNameBottomSheet() async {
    await CustomModalBottomSheet.showModalBottomSheet(
        context: context,
        enableDrag: true,
        height: MediaQuery.of(context).size.height * 0.4,
        body: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ChangeNotifierProvider.value(
            value: this,
            child: const EditDataBottomSheet(
              bottomSheetContent: EditNameBottomSheet(),
            ),
          ),
        ));
    // await Provider.of<MainCoreProvider>(Get.context!, listen: false).getCachedUserCredential();
  }

  Future<void> openEditPhoneBottomSheet() async {
    await CustomModalBottomSheet.showModalBottomSheet(
        context: context,
        enableDrag: true,
        height: MediaQuery.of(context).size.height * 0.4,
        body: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ChangeNotifierProvider.value(
            value: this,
            child: EditDataBottomSheet(
              bottomSheetContent: EditPhoneNumberBottomSheet(
                mobileNumberController: phoneNumController,
              ),
            ),
          ),
        ));
    // await Provider.of<MainCoreProvider>(Get.context!, listen: false).getCachedUserCredential();
  }

  Future<void> openEmailBottomSheet() async {
    await CustomModalBottomSheet.showModalBottomSheet(
        context: context,
        enableDrag: true,
        height: MediaQuery.of(context).size.height * 0.4,
        body: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ChangeNotifierProvider.value(
            value: this,
            child: EditDataBottomSheet(
              bottomSheetContent: EditEmailBottomSheet(
                emailController: emailController,
              ),
            ),
          ),
        ));
    // await Provider.of<MainCoreProvider>(Get.context!, listen: false).getCachedUserCredential();
  }

  Future<void> openGenderBottomSheet() async {
    await CustomModalBottomSheet.showModalBottomSheet(
        context: context,
        enableDrag: true,
        height: MediaQuery.of(context).size.height * 0.4,
        body: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ChangeNotifierProvider.value(
            value: this,
            child: const EditDataBottomSheet(
              bottomSheetContent: EditGenderBottomSheet(),
            ),
          ),
        ));
    // await Provider.of<MainCoreProvider>(Get.context!, listen: false).getCachedUserCredential();
  }

  Future<void> openCityBottomSheet() async {
    await CustomModalBottomSheet.showModalBottomSheet(
        context: context,
        enableDrag: true,
        height: MediaQuery.of(context).size.height * 0.4,
        body: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ChangeNotifierProvider.value(
            value: this,
            child: EditDataBottomSheet(
              bottomSheetContent: EditLocationBottomSheet(
                cityOptions: cityOptions,
              ),
            ),
          ),
        ));
    // await Provider.of<MainCoreProvider>(Get.context!, listen: false).getCachedUserCredential();
  }

  void showVerifyBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return VerifyScreen(
            mobileNumber: phoneNumController.text,
          );
        });
  }

  String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'mobileNumberIsNotCorrect';
    } else {
      return 'mobileNumberIsNotCorrect';
    }
  }
}

Future<Uint8List> convertXFileToUint8List(XFile file) async {
  Uint8List bytes = await file.readAsBytes();
  return bytes;
}

Future<File> convertUnit8ListToFile({required Uint8List imageInUnit8List}) async {
  final tempDir = await getTemporaryDirectory();
  File file = await File('${tempDir.path}/${DateTime.now()}.png').create();
  file.writeAsBytesSync(imageInUnit8List);
  return file;
}
