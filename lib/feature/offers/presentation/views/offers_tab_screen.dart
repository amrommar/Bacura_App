import 'package:bacura_app/core/presentation/widget/shimmer.dart';
import 'package:bacura_app/core/services/number_parser.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/index.dart';
import 'package:bacura_app/feature/offers/presentation/controller/offers_provider.dart';

class OffersTabScreen extends StatefulWidget {
  const OffersTabScreen({super.key});

  @override
  _OffersTabScreenState createState() => _OffersTabScreenState();
}

class _OffersTabScreenState extends State<OffersTabScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final provider = context.read<OffersProvider>();
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100 &&
        !provider.isLoadingMore) {
      provider.loadMoreOffers();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                        Expanded(
                          child: RefreshIndicator(
                            color: ColorManager.primaryBlueColor,
                            backgroundColor: ColorManager.whiteColor,
                            onRefresh: () async {
                              await provider.getOffers();
                            },
                            child: ListView.builder(
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: provider.filteredorders.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OfferDetailsScreen(
                                          index: index,
                                          id: provider.offersEntity.offersDataEntity[index].id!,
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
                                  ),
                                );
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
