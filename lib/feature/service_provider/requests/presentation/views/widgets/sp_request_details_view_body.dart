import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_details_icon_texts_row.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_time_date.dart';
import 'package:bacura_app/feature/service_provider/home/presentation/views/widgets/sp_request_num_row.dart';
import 'package:bacura_app/feature/service_provider/requests/presentation/views/widgets/customer_name_row.dart';
import 'package:bacura_app/feature/service_provider/requests/presentation/views/widgets/customer_request_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpRequestDetailsViewBody extends StatefulWidget {
  const SpRequestDetailsViewBody({super.key});

  @override
  State<SpRequestDetailsViewBody> createState() => _SpRequestDetailsViewBodyState();
}

class _SpRequestDetailsViewBodyState extends State<SpRequestDetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(color: ColorManager.whiteColor, borderRadius: BorderRadius.circular(AppSize.s12), boxShadow: [
          BoxShadow(
            color: ColorManager.midWhiteColor,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          )
        ]),
        margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        height: 800.h,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              ////  Request Number  section/////////////////////////////////////////////

              const SpRequestNumRow(),
              const Divider(),
              ////Time and Date section/////////////////////////////////////////////
              const RequestTimeDate(),
              const Divider(),
              SizedBox(height: 10.h),
              const CustomerNameRow(),
              SizedBox(height: 5.h),

              /// Request Details section/////////////////////////////////////////////
              const CustomerRequestComponents(),

              SizedBox(height: 0.h),

              /// Total Money section/////////////////////////////////////////////
              Text('تركيب وبرمجة',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.primaryBlueColor,
                        fontWeight: FontWeight.bold,
                      )),
              const Divider(),

              ///  location section/////////////////////////////////////////////
              Image.asset('assets/images/map.png', height: 160),

              ///  Payment status section/////////////////////////////////////////////
              RequestDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.payment_status,
                  description: 'تم الدفع',
                  icon: Icons.check_circle,
                  iconColor: ColorManager.darkGreenColor),

              ///  Warranty status section/////////////////////////////////////////////
              RequestDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.warranty_status,
                  description: 'ساري',
                  icon: Icons.verified_user,
                  iconColor: ColorManager.midBlueColor),
              const Divider(),
              SizedBox(height: 50.h),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                    AppSize.s8,
                  ))),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.requestImplementRoute);
                  },
                  child: Text('تم تجهيز المواد',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.whiteColor,
                          ))),
            ])));
  }
}
