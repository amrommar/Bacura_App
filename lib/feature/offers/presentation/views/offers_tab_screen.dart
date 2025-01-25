import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/index.dart';

class OffersTabScreen extends StatefulWidget {
  const OffersTabScreen({super.key});

  @override
  State<OffersTabScreen> createState() => _OffersTabScreenState();
}

class _OffersTabScreenState extends State<OffersTabScreen> {
  /////////////////////////////////////              From Back-End          ////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.whiteColor,
        child: Column(children: [
          SizedBox(height: 5.h),

          const OfferFilterWidget(),

          Padding(padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6), child: Divider(color: ColorManager.lightBlueColor)),

          /// Offer List section ///////////////////////////////////////////////////////
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.offerDetailsRoute);
                        },
                        child: CustomOfferContainerWidget());
                  }))
        ]));
  }
}
