import 'package:bacura_app/core/presentation/widget/custom_loading_shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/edit_phone_number_bottom_sheet.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(elevation: 0),
      body: ChangeNotifierProvider(
        create: (context) => MyProfileProvider(),
        child: SingleChildScrollView(
          child: Consumer<MyProfileProvider>(builder: (context, provider, child) {
            var profileEntity = provider.myProfileEntity;
            return provider.isLoading
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        9,
                        (index) => const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomLoadingShimmer(height: 60, width: double.infinity),
                        ),
                      ),
                    ),
                  )
                : Column(children: [
                    AvatarWidget(
                      onEditImage: () async => await provider.pickImage(context),
                      imagePath: profileEntity.image ?? 'assets/images/Ellipse 1.png',
                      userName: provider.myProfileEntity.name!,
                      onEditName: () {
                        showEditDetailsBottomSheet(AppLocalizations.of(context)!.fullName, context);
                      },
                    ),

                    CustomShadowWidget(
                        childWidget: Column(children: [
                      ProfileDetailsWidget(
                        icon: Icons.phone_outlined,
                        text: AppLocalizations.of(context)!.mobileNumber,
                        value: '+${profileEntity.countryCode}${profileEntity.phone}',
                        onTap: () {
                          showEditDetailsBottomSheet(AppLocalizations.of(context)!.mobileNumber, context);
                        },
                      ),
                      Divider(color: ColorManager.lightBlueColor, height: 20),
                      ProfileDetailsWidget(
                        icon: Icons.mail_outline_outlined,
                        text: AppLocalizations.of(context)!.email,
                        value: profileEntity.email!,
                        onTap: () {
                          showEditDetailsBottomSheet(AppLocalizations.of(context)!.email, context);
                        },
                      ),
                      Divider(color: ColorManager.lightBlueColor, height: 20),
                      ProfileDetailsWidget(
                          onTap: () {
                            showEditDetailsBottomSheet(AppLocalizations.of(context)!.gender, context);
                          },
                          icon: Icons.transgender_outlined,
                          text: AppLocalizations.of(context)!.gender,
                          value: profileEntity.gender!),
                      Divider(color: ColorManager.lightBlueColor, height: 20),
                      ProfileDetailsWidget(
                          onTap: () {
                            showEditDetailsBottomSheet(AppLocalizations.of(context)!.city, context);
                          },
                          icon: Icons.location_on_outlined,
                          text: AppLocalizations.of(context)!.city,
                          value: profileEntity.location!),
                    ])),

                    SizedBox(height: 80.h),

                    // Logout Button
                    const CustomLogoutButton(),
                  ]);
          }),
        ),
      ),
    );
  }

  showEditDetailsBottomSheet(String text, BuildContext context) {
    final formKey = GlobalKey<FormState>();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) => MyProfileProvider(),
          child: Consumer<MyProfileProvider>(
            builder: (context, provider, child) {
              if (text == AppLocalizations.of(context)!.mobileNumber) {
                /// mobile number edit //////////////////////
                return EditPhoneNumberBottomSheet(
                  formKey: formKey,
                  mobileNumberController: provider.mobileNumberController,
                );
              }

              /// email edit //////////////////////
              else if (text == AppLocalizations.of(context)!.email) {
                return EditEmailBottomSheet(
                  formKey: formKey,
                  emailController: provider.emailController,
                );
              }

              /// gender edit //////////////////////
              else if (text == AppLocalizations.of(context)!.gender) {
                return EditGenderBottomSheet(genderOptions: provider.genderOptions);
              }

              /// city edit //////////////////////
              else if (text == AppLocalizations.of(context)!.city) {
                return EditLocationBottomSheet(cityOptions: provider.cityOptions);
              }

              /// user name edit //////////////////////
              // else if (text == AppLocalizations.of(context)!.fullName) {
              //   return EditNameBottomSheet(formKey: formKey);
              // }
              return Container();
            },
          ),
        );
      },
    );
  }
}

class EditNameBottomSheet extends StatelessWidget {
  const EditNameBottomSheet({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProfileProvider>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    fieldName: AppLocalizations.of(context)!.fullName,
                    hintText: AppLocalizations.of(context)!.enterYourName,
                    controller: provider.nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppLocalizations.of(context)!.pleaseEnterYourName;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  CustomSmallElevatedButton(
                    text: AppLocalizations.of(context)!.save,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // provider.name = provider.nameController.text;

                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditLocationBottomSheet extends StatelessWidget {
  const EditLocationBottomSheet({
    super.key,
    required this.cityOptions,
  });

  final List<String> cityOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
            height: 250.h,
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              CustomDropDownField(
                selectedOption: 'الرياض',
                options: cityOptions,
                fieldName: AppLocalizations.of(context)!.city,
              ),
              SizedBox(height: 20.h),
              CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
                  onPressed: () {
                    /////////////////////// Method to save changes //////////////////////
                    Navigator.pop(context);
                  })
            ])),
      ),
    );
  }
}

class EditGenderBottomSheet extends StatelessWidget {
  const EditGenderBottomSheet({
    super.key,
    required this.genderOptions,
  });

  final List<String> genderOptions;

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProfileProvider>(
      builder: (context, provider, child) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
              height: 250.h,
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                CustomDropDownField(
                  selectedOption: provider.myProfileEntity.gender!,
                  options: genderOptions,
                  fieldName: AppLocalizations.of(context)!.gender,
                ),
                SizedBox(height: 20.h),
                CustomSmallElevatedButton(
                    text: AppLocalizations.of(context)!.save,
                    onPressed: () {
                      /////////////////////// Method to save changes //////////////////////
                      Navigator.pop(context);
                    })
              ])),
        ),
      ),
    );
  }
}

class EditEmailBottomSheet extends StatelessWidget {
  const EditEmailBottomSheet({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Form(
                key: formKey,
                child: CustomTextFormField(
                  fieldName: AppLocalizations.of(context)!.email,
                  hintText: AppLocalizations.of(context)!.email,
                  controller: emailController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return AppLocalizations.of(context)!.enter_your_email;
                    }
                    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                    if (!emailValid) {
                      return AppLocalizations.of(context)!.please_enter_valid_email;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.h),
              CustomSmallElevatedButton(
                  text: AppLocalizations.of(context)!.save,
                  onPressed: () {
                    if (formKey.currentState!.validate() == true) {
                      Navigator.pop(context);
                    }
                  })
            ])),
      ),
    );
  }
}
