import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';

class ServicesComponent extends StatelessWidget {
  ServicesComponent({super.key});

  List<String> imagesPaths = [
    AppAssets.cameraIcon,
    AppAssets.smartHomeIcon,
    AppAssets.accessControlIcon,
    AppAssets.soundSystemsIcon,
    AppAssets.savePowerIcon,
    AppAssets.networkIcon,
    AppAssets.gameRepairIcon,
    AppAssets.pcRepairIcon,
    AppAssets.phoneRepairIcon
  ];
  List<String> imageTitle = [
    AppStrings.security_and_monitoring,
    AppStrings.smartSystems,
    AppStrings.accessControl,
    AppStrings.soundSystems,
    AppStrings.saveEnergy,
    AppStrings.networksCommunications,
    AppStrings.gameMaintenance,
    AppStrings.computerMaintenance,
    AppStrings.phoneMaintenance
  ];

  @override
  Widget build(BuildContext context) {
    List<String> imagesTitle = [
      AppLocalizations.of(context)!.surveillance_cameras,
      AppLocalizations.of(context)!.smart_systems,
      AppLocalizations.of(context)!.access_control,
      AppLocalizations.of(context)!.sound_systems,
      AppLocalizations.of(context)!.save_energy,
      AppLocalizations.of(context)!.internet_communications_networks,
      AppStrings.gameMaintenance,
      AppStrings.computerMaintenance,
      AppStrings.phoneMaintenance
    ];
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Container(
          padding: EdgeInsets.all(AppSizes.ph4),
          decoration: BoxDecoration(
            color: ColorManager.midWhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: AppSizes.pw16, left: AppSizes.pw16, top: AppSizes.ph6),
                  child: Text(AppLocalizations.of(context)!.services,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.blackColor,
                            fontWeight: FontWeight.bold,
                          ))),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.categoryEntity.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.89,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.serviceTypeRoute, arguments: provider.categoryEntity[index].id);
                        },
                        child: ServiceCardWidget(
                          departmentTitle: provider.categoryEntity[index].name!,
                          imagePath: provider.categoryEntity[index].image!,
                        ));
                  }),
            ],
          )),
    );
  }
}
