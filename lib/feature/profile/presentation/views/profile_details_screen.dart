import 'package:bacura_app/core/presentation/widget/custom_loading_shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

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
        create: (context) => MyProfileProvider(context),
        child: SingleChildScrollView(
          child: Consumer<MyProfileProvider>(builder: (context, provider, child) {
            var profileEntity = provider.myProfileEntity;
            return provider.isLoading
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        9,
                        (index) => Padding(
                          padding: EdgeInsets.all(AppSizes.ph8),
                          child: CustomLoadingShimmer(height: AppSizes.ph60, width: double.infinity),
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      AvatarWidget(
                        onEditImage: () async {
                          await provider.pickImage(context);
                        },
                        imagePath:
                            // profileEntity.image ??
                            AppAssets.bacuraImage,
                        userName: provider.myProfileEntity.name!,
                        onEditName: () {
                          provider.openNameBottomSheet();
                        },
                      ),

                      CustomShadowWidget(
                        childWidget: Column(
                          children: [
                            ProfileDetailsWidget(
                              icon: Icons.phone_outlined,
                              text: AppLocalizations.of(context)!.mobileNumber,
                              value: '${profileEntity.phone}',
                              onTap: () {
                                provider.openEditPhoneBottomSheet();
                              },
                            ),
                            Divider(color: ColorManager.lightBlueColor, height: AppSizes.ph20),
                            ProfileDetailsWidget(
                              icon: Icons.mail_outline_outlined,
                              text: AppLocalizations.of(context)!.email,
                              value: profileEntity.email!,
                              onTap: () {
                                provider.openEmailBottomSheet();
                              },
                            ),
                            Divider(color: ColorManager.lightBlueColor, height: AppSizes.ph20),
                            ProfileDetailsWidget(
                                onTap: () {
                                  provider.openGenderBottomSheet();
                                },
                                icon: Icons.transgender_outlined,
                                text: AppLocalizations.of(context)!.gender,
                                value: profileEntity.gender! == 'male' ? 'ذكر' : 'أنثي'),
                            Divider(color: ColorManager.lightBlueColor, height: AppSizes.ph20),
                            ProfileDetailsWidget(
                                onTap: () {
                                  provider.openCityBottomSheet();
                                },
                                icon: Icons.location_on_outlined,
                                text: AppLocalizations.of(context)!.city,
                                value: profileEntity.location!),
                          ],
                        ),
                      ),

                      SizedBox(height: AppSizes.ph80),

                      // Logout Button
                      const CustomLogoutButton(),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
