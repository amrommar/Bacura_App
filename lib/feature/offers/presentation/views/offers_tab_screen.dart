import 'package:bacura_app/core/presentation/widget/shimmer.dart';
import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/index.dart';
import 'package:bacura_app/feature/offers/presentation/controller/offers_provider.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class OffersTabScreen extends StatelessWidget {
  const OffersTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffersProvider(),
      child: Consumer<OffersProvider>(
        builder: (context, provider, child) => Container(
          color: ColorManager.whiteColor,
          child: provider.isLoadingOffers
              ? buildShimmerContainer()
              : provider.offersEntity.totalRecords == 0
                  ? const Center(child: Text('لا يوجد عروض'))
                  : Column(
                      children: [
                        SizedBox(height: AppSizes.ph5),
                        // const OfferFilterWidget(),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: AppSizes.pw6),
                        //   child: Divider(color: ColorManager.lightBlueColor),
                        // ),
                        Expanded(
                          child: LazyLoadScrollView(
                            onEndOfPage: () => provider.loadMoreOffers(),
                            child: ListView.builder(
                              itemCount: provider.filteredorders.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OfferDetailsScreen(
                                            name: provider.offersEntity.offersDataEntity[index].name!,
                                            description: provider.offersEntity.offersDataEntity[index].description!,
                                            imageUrl: provider.offersEntity.offersDataEntity[index].image!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: CustomOfferContainerWidget(
                                      imagePath: provider.offersEntity.offersDataEntity[index].image!,
                                      title: provider.offersEntity.offersDataEntity[index].name!,
                                      cost:
                                          ' ${NumberParser.translateNumber((provider.offersEntity.offersDataEntity[index].total!).toString())} ريال',
                                      expireDate: provider.getRemainingDays(index),
                                      content: provider.offersEntity.offersDataEntity[index].description!,
                                    ));
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.ph25),
                        provider.isLoadingMore
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: ColorManager.primaryBlueColor,
                                )),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
        ),
      ),
    );
  }
}
