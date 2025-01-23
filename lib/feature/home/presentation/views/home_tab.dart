import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/home/index.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      // Ad Slider Section_____________________________________________________
      const AdsSlider(),

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
        RareServiceWidget(
          onTap: () {
            Navigator.pushNamed(context, Routes.cinemaDetailsRoute);
          },
          imagePath: 'assets/images/cinemaWhite.png',
          serviceTitle: 'السينما المنزلية',
        ),
        /////////////////    Consultation Section    ////////////////////////////
        RareServiceWidget(
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
