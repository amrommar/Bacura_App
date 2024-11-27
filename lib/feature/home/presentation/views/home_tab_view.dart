import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/home_ads_slider.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/rare_service.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/services_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          onTap: () {},
          imagePath: 'assets/images/Home-Cinema.jpg',
        ),
        /////////////////    Consultation Section    ////////////////////////////
        RareService(
          imagePath: 'assets/images/consultionss.jpg',
          onTap: () {
            Navigator.pushNamed(context, Routes.consultationScreenRoute);
          },
        ),
      ])
    ]));
  }
}
