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
              : Column(
                  children: [
                    SizedBox(height: AppSizes.ph5),
                    const OfferFilterWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw6),
                      child: Divider(color: ColorManager.lightBlueColor),
                    ),
                    Expanded(
                      child: LazyLoadScrollView(
                        onEndOfPage: () => provider.loadMoreOffers(),
                        child: ListView.builder(
                          itemCount: provider.filteredRequests.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OfferDetailsScreen(),
                                    ),
                                  );
                                },
                                child: CustomOfferContainerWidget(
                                  imagePath: provider.offersEntity.offersDataEntity[index].image!,
                                  name: provider.offersEntity.offersDataEntity[index].name!,
                                  cost:
                                      ' ${NumberParser.translateNumber((provider.offersEntity.offersDataEntity[index].total!).toString())} ريال',
                                  expireDate: provider.getRemainingDays(index),
                                ));
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.ph25),
                    provider.isLoadingMore
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
        ),
      ),
    );
  }
}
