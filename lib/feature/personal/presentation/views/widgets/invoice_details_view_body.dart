import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/download_invoice_row.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/invoice_time_date_row.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/service_details_list.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/service_provider_name_row.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/total_price_row.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_details_icon_texts_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoiceDetailsViewBody extends StatelessWidget {
  const InvoiceDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: ColorManager.lightBlueColor, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(12),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: ListView(children: [
          ////  Request Number  section/////////////////////////////////////////////
          Text('#3333452',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          ////  Request Number and Time and Date section/////////////////////////////////////////////
          const InvoiceTimeDateRow(),
          Divider(color: ColorManager.whiteColor),

          const ServiceProviderNameRow(),
          Divider(color: ColorManager.whiteColor),
          Text(AppLocalizations.of(context)!.service_descript,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor)),
          SizedBox(height: 10.h),
          const ServiceDetailsList(),
          Divider(color: ColorManager.whiteColor),
          ////  money and payment method section/////////////////////////////////////////////
          const TotalPriceRow(),
          SizedBox(height: 20.h),

          ///  Location section/////////////////////////////////////////////
          RequestDetailsIconTextsRow(
            title: AppLocalizations.of(context)!.location,
            description: ' الرياض حي العارض شارع أسماء بنت مالك',
            icon: Icons.location_on,
          ),

          ///  Payment Method section/////////////////////////////////////////////
          RequestDetailsIconTextsRow(
            title: AppLocalizations.of(context)!.payment_method,
            description: 'بطاقة إئتمان',
            icon: Icons.monetization_on_outlined,
            iconColor: ColorManager.greyColor,
          ),
          //  Payment status section/////////////////////////////////////////////
          RequestDetailsIconTextsRow(
            title: AppLocalizations.of(context)!.payment_status,
            description: 'تم الدفع',
            icon: Icons.check_circle,
            iconColor: ColorManager.darkGreenColor,
          ),

          ///  Warranty status section/////////////////////////////////////////////
          RequestDetailsIconTextsRow(
            title: AppLocalizations.of(context)!.warranty_status,
            description: 'ساري',
            icon: Icons.verified_user,
            iconColor: ColorManager.midBlueColor,
          ),
          SizedBox(height: 60.h),
          const DownloadInvoiceRow()
        ]));
  }
}
