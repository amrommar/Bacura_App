import 'package:bacura_app/core/utils/dialog_function.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/rare_service_widget.dart';
import 'package:bacura_app/feature/profile/presentation/controller/my_profile_provider.dart';

class RareServiceComponent extends StatelessWidget {
  const RareServiceComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      final profileProvider = Provider.of<MyProfileProvider>(context, listen: false);
      final rareCategories = provider.categoryEntity
          .where((category) => category.type == "consultation" || category.type == "cinema")
          .toList();
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.ph8,
          horizontal: AppSizes.ph14,
        ),
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(AppSizes.br12),
            ),
        child: Column(
          children: [
            Divider(
              color: ColorManager.primaryBlueColor,
            ),
            Text(tr(AppStrings.specialServices),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.darkBlueColor,
                      fontWeight: FontWeight.bold,
                    )),
            Container(
              height: AppSizes.ph156,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: false,
                      itemCount: rareCategories.length,
                      itemBuilder: (context, index) => RareServiceWidget(
                        onTap: () {
                          profileProvider.token == null
                              ? customShowCustomDialog(
                                  context: context,
                                  title: tr(AppStrings.login),
                                  imagePath: AppAssets.badFeedback,
                                  content: tr(AppStrings.pleaseLoginFirst),
                                  isOk: true,
                                  isCancel: true,
                                  onCancel: () {
                                    Navigator.pop(context);
                                  },
                                  onOk: () {
                                    Navigator.pushNamed(context, Routes.loginRoute);
                                  },
                                )
                              : rareCategories[index].type == "consultation"
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ConsultationOrderScreen(
                                                categoryEntity: rareCategories[index],
                                              )))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CinemaOrderScreen(
                                                categoryId: rareCategories[index].id!,
                                              )));
                        },
                        imagePath: rareCategories[index].image ?? '',
                        serviceTitle: rareCategories[index].name ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: ColorManager.primaryBlueColor,
            )
          ],
        ),
      );
    });
  }
}
