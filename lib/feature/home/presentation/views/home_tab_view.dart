import 'package:bacura_app/core/utils/index.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      // Ad Slider Section_____________________________________________________
      const HomeAdsSlider(),

      ///////////////////////////////   Services Section      //////////////////////////////////////////////
      // Services List (could be GridView as well)
      ServicesGridView(),
      const SizedBox(height: 10),
      Text(AppLocalizations.of(context)!.services_for_you,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkBlueColor,
                fontWeight: FontWeight.bold,
              )),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        /////////////////       Cinema Section     ////////////////////////////
        RareService(
          onTap: () {
            Navigator.pushNamed(context, Routes.cinemaDetailsRoute);
          },
          imagePath: 'assets/images/cinemaWhite.png',
          serviceTitle: 'السينما المنزلية',
        ),
        /////////////////    Consultation Section    ////////////////////////////
        RareService(
          imagePath: 'assets/images/consultationWhite.png',
          serviceTitle: 'الاستشارات',
          onTap: () {
            Navigator.pushNamed(context, Routes.consultationScreenRoute);
          },
        ),
      ])
    ]));
  }
}
