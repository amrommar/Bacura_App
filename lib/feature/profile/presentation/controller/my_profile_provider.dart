import 'package:bacura_app/core/presentation/widget/custom_dialog_services.dart';
import 'package:bacura_app/core/presentation/widget/custom_modal_bottom_sheet.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/auth/presentation/views/components/verify_bottom_sheet.dart';
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
  String? selectedGender;
  String? selectedCity;

  final BuildContext context;

  final List<String> genderOptions = ['ذكر', 'أنثي'];
  final List<String> cityOptions = ['الرياض', 'جده', 'مكة', 'الدمام'];
  final ImagePicker _picker = ImagePicker();
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
    await sl<UpdateProfileUseCase>().call(UpdateProfileParameters(
      name: myProfileEntity.name == nameController.text ? null : nameController.text,
      email: myProfileEntity.email == emailController.text ? null : emailController.text,
      phone: myProfileEntity.phone == completePhoneNumber ? null : completePhoneNumber,
      gender: myProfileEntity.gender == selectedGender ? null : selectedGender,
      location: myProfileEntity.location == selectedCity ? null : selectedCity,
      image: myProfileEntity.image == selectedImage?.path ? null : selectedImage?.path.replaceFirst('/', ''),
    ));
    _getMyProfile();
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
                    updateMyProfile();
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
                    updateMyProfile();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
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
          return VerifyBottomSheet(
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
