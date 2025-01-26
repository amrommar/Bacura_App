import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/requests/index.dart';

class RequestDetailsScreen extends StatefulWidget {
  const RequestDetailsScreen({super.key});

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as RequestDetailsArguments;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.request_details,
        )),
        body: Container(
            decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(AppSizes.br12),
                boxShadow: [
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
                  ////  Request Number and Icons for Contact section/////////////////////////////////////////////
                  RequestNumContactIconWidget(requestColor: ColorManager.yellowColor),
                  const Divider(),
                  ////Time and Date section/////////////////////////////////////////////
                  const RequestTimeDateWidget(),

                  /// Request Details section/////////////////////////////////////////////
                  ///
                  const RequestComponentsList(),

                  /// Total Money section/////////////////////////////////////////////
                  const RequestTotalPriceWidget(),
                  const Divider(),

                  ///  location section/////////////////////////////////////////////
                  RequestDetailsIconTextsRow(
                    title: AppLocalizations.of(context)!.location,
                    description: ' الرياض حي العارض شارع أسماء بنت مالك',
                    icon: Icons.location_on,
                  ),

                  /// Payment Method section/////////////////////////////////////////////
                  RequestDetailsIconTextsRow(
                      title: AppLocalizations.of(context)!.payment_method,
                      description: 'بطاقة إئتمانية',
                      icon: Icons.credit_card,
                      iconColor: ColorManager.greyColor),

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
                  manageRequestButtons(ColorManager.yellowColor),
                  SizedBox(height: 20.h),
                ]))));
  }

  Widget manageRequestButtons(Color requestColor) {
    if (requestColor == ColorManager.yellowColor) {
      //////////           Request Management Elevated Button              //////////////////////////////////////////
      return OnGoingRequestBottomWidget(onPressed: () {
        showManageRequestBottomSheet();
      });
    } else if (requestColor == ColorManager.redColor) {
      //////////           Request Cancelled icon and text             //////////////////////////////////////////
      return const CancelledRequestBottomWidget();
    } else if (requestColor == ColorManager.greenColor) {
      //////////          Completed Request button and text             //////////////////////////////////////////
      return const CompletedRequestBottomWidget();
    }
    return Container();
  }

  void showManageRequestBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ManageOnGoingRequestBottomSheet();
        });
  }
}
