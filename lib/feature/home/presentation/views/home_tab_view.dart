import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/departments_grid_view.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/home_ads_slider.dart';
import 'package:bacura_app/feature/home/presentation/views/widgets/rare_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_manager.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({super.key});

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Ad Slider Section_____________________________________________________
      const HomeAdsSlider(),

      ///////////////////////////////   Departments Section      //////////////////////////////////////////////
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(AppLocalizations.of(context)!.departments,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.blackColor,
                    fontWeight: FontWeight.bold,
                  ))),
      Divider(color: ColorManager.lightBlueColor, thickness: 2),
      // Apartments List (could be GridView as well)
      DepartmentsGridView(),
      Divider(color: ColorManager.lightBlueColor, thickness: 2),
      Row(children: [
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
