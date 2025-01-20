import 'package:bacura_app/core/utils/index.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.invoice,
        )),
        body: Container(
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
              const InvoiceTimeDateWidget(),
              Divider(color: ColorManager.whiteColor),

              const ServiceProviderNameWidget(),
              Divider(color: ColorManager.whiteColor),
              Text(AppLocalizations.of(context)!.service_descript,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor)),
              SizedBox(height: 10.h),
              const ServiceDetailsList(),
              Divider(color: ColorManager.whiteColor),
              ////  money and payment method section/////////////////////////////////////////////
              const TotalPriceWidget(),
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
              const DownloadInvoiceWidget()
            ])));
  }
}
