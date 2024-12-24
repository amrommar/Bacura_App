import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:bacura_app/feature/offers/presentation/views/widgets/custom_offer_container.dart';
import 'package:bacura_app/feature/offers/presentation/views/widgets/offer_filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Offers_Tab extends StatefulWidget {
  const Offers_Tab({super.key});

  @override
  State<Offers_Tab> createState() => _Offers_TabState();
}

class _Offers_TabState extends State<Offers_Tab> {
  /////////////////////////////////////              From Back-End          ////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorManager.whiteColor,
        child: Column(children: [
          SizedBox(height: 5.h),

          OfferFilterSection(),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
              child: Divider(color: ColorManager.lightBlueColor)),

          /// Offer List section ///////////////////////////////////////////////////////
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.offerDetailsRoute);
                        },
                        child: Custom_Offer_container());
                  }))
        ]));
  }
}
