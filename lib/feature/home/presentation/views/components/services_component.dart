import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';

class CategoryComponent extends StatelessWidget {
  CategoryComponent({super.key});

  // List<String> imagesPaths = [
  //   AppAssets.cameraIcon,
  //   AppAssets.smartHomeIcon,
  //   AppAssets.soundSystemsIcon,
  //   AppAssets.savePowerIcon,
  //   AppAssets.networkIcon,
  //   'assets/images/svg/pc.svg',
  //   'assets/images/svg/phone.svg',
  //   'assets/images/svg/accessories.svg',
  //   AppAssets.gameRepairIcon
  // ];

  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(
                    right: AppSizes.pw16,
                    left: AppSizes.pw16,
                    top: AppSizes.ph6,
                  ),
                  child: Text(AppLocalizations.of(context)!.services,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.blackColor,
                            fontWeight: FontWeight.bold,
                          ))),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: provider.categoryEntity.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: AppSizes.ph5,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          provider.goToServiceScreen(
                            context,
                            provider.categoryEntity[index],
                          );
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
