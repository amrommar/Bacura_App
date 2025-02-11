import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/presentation/controller/home_provider.dart';
import 'package:bacura_app/feature/home/presentation/widgets/rare_service_widget.dart';

class RareServiceComponent extends StatelessWidget {
  const RareServiceComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      final rareCategories = provider.categoryEntity
          .where((category) => category.type == "consultation" || category.type == "cinema")
          .toList();
      return Column(
        children: [
          Text(AppLocalizations.of(context)!.services_for_you,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
          Container(
            padding: EdgeInsets.only(right: AppSizes.ph12),
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
                        rareCategories[index].type == "consultation"
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
        ],
      );
    });
  }
}
