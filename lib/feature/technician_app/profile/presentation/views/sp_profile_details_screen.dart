import 'package:bacura_app/core/presentation/widget/custom_loading_shimmer.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/completed_requests_widget.dart';
import 'package:bacura_app/feature/profile/presentation/views/components/requests_calender_widget.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/views/components/sp_avatar_widget.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/views/components/sp_profile_details_widget.dart';

class SpProfileDetailsScreen extends StatefulWidget {
  const SpProfileDetailsScreen({super.key});

  @override
  State<SpProfileDetailsScreen> createState() => _SpProfileDetailsScreenState();
}

class _SpProfileDetailsScreenState extends State<SpProfileDetailsScreen> {
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
                          child: CustomLoadingShimmer(
                            height: AppSizes.ph60,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      SpAvatarWidget(
                        imagePath: profileEntity.image,
                        userName: provider.myProfileEntity.name!,
                      ),

                      CustomShadowWidget(
                        childWidget: Column(
                          children: [
                            SpProfileDetailsWidget(
                              icon: Icons.phone_outlined,
                              text: tr(AppStrings.mobileNumber),
                              value: '${profileEntity.phone}',
                            ),
                            Divider(
                              color: ColorManager.lightBlueColor,
                              height: AppSizes.ph20,
                            ),
                            SpProfileDetailsWidget(
                              icon: Icons.mail_outline_outlined,
                              text: tr(AppStrings.email),
                              value: profileEntity.email!,
                            ),
                            Divider(
                              color: ColorManager.lightBlueColor,
                              height: AppSizes.ph20,
                            ),
                            SpProfileDetailsWidget(
                              icon: Icons.transgender_outlined,
                              text: tr(AppStrings.gender),
                              value: profileEntity.gender! == 'male'
                                  ? tr(AppStrings.male)
                                  : tr(
                                      AppStrings.female,
                                    ),
                            ),
                            Divider(
                              color: ColorManager.lightBlueColor,
                              height: AppSizes.ph20,
                            ),
                            SpProfileDetailsWidget(
                                icon: Icons.location_on_outlined,
                                text: tr(AppStrings.city),
                                value: profileEntity.location!),
                          ],
                        ),
                      ),

                      const ordersCalenderWidget(),

                      const CompleteOrdersWidget(),

                      SizedBox(height: AppSizes.ph30),

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
