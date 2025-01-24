import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';

class ServicesGridView extends StatelessWidget {
  ServicesGridView({super.key});

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
    AppStrings.networks_communications,
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
    return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: ColorManager.midWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 6),
                child: Text(AppLocalizations.of(context)!.services,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.blackColor,
                          fontWeight: FontWeight.bold,
                        ))),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                // Disable scrolling inside GridView
                shrinkWrap: true,
                // Let it take only necessary height
                itemCount: 6,
                // Replace with your departments list length
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of items per row
                    crossAxisSpacing: 0, // Horizontal space between items
                    mainAxisSpacing: 5, // Vertical space between items
                    childAspectRatio: 0.89),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.serviceTypeRoute);
                      },
                      child: ServiceCardWidget(
                        departmentTitle: imagesTitle[index],
                        imagePath: imagesPaths[index],
                      )); // Widget for each apartment card
                }),
          ],
        ));
  }
}
