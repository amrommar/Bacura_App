import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';

class CategoryComponent extends StatelessWidget {
  const CategoryComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      final serviceCategories = provider.categoryEntity.where((category) => category.type == "service").toList();
      return Container(
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
              itemCount: serviceCategories.length,
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
                      serviceCategories[index],
                    );
                  },
                  child: ServiceCardWidget(
                    departmentTitle: serviceCategories[index].name!,
                    imagePath: serviceCategories[index].image!,
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
