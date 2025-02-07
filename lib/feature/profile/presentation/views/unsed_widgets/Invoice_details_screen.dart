import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/presentation/views/widget/request_details_icon_texts_row.dart';
import 'package:bacura_app/feature/profile/index.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  const InvoiceDetailsScreen({super.key});

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
            decoration: BoxDecoration(
              color: ColorManager.lightBlueColor,
              borderRadius: BorderRadius.circular(AppSizes.br10),
            ),
            margin: EdgeInsets.all(AppSizes.ph12),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
            child: ListView(children: [
              ////  Request Number  section/////////////////////////////////////////////
              Text('#3333452',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.primaryBlueColor, fontWeight: FontWeight.bold)),
              SizedBox(height: AppSizes.ph10),
              ////  Request Number and Time and Date section/////////////////////////////////////////////
              const InvoiceTimeDateWidget(),
              Divider(color: ColorManager.whiteColor),

              const ServiceProviderNameWidget(),
              Divider(color: ColorManager.whiteColor),
              Text(
                AppLocalizations.of(context)!.service_descript,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
              ),
              SizedBox(height: AppSizes.ph10),
              const ServiceDetailsList(),
              Divider(color: ColorManager.whiteColor),
              ////  money and payment method section/////////////////////////////////////////////
              const TotalPriceWidget(),
              SizedBox(height: AppSizes.ph20),

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
              SizedBox(height: AppSizes.ph60),
              const DownloadInvoiceWidget()
            ])));
  }
}
