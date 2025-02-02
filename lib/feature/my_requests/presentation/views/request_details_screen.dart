import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/my_requests/index.dart';

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
            decoration: BoxDecoration(color: ColorManager.whiteColor, borderRadius: BorderRadius.circular(AppSizes.br12), boxShadow: [
              BoxShadow(
                color: ColorManager.midWhiteColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
            margin: EdgeInsets.symmetric(horizontal: AppSizes.ph12, vertical: AppSizes.ph12),
            padding: EdgeInsets.symmetric(horizontal: AppSizes.ph12, vertical: AppSizes.ph12),
            height: AppSizes.ph800,
            child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
              RequestNumContactIconWidget(requestColor: ColorManager.yellowColor, requestNumber: '123456789'),
              const Divider(),
              const RequestTimeDateWidget(date: '10/10/2023', time: '10:00 AM'),
              const RequestComponentsList(),
              const RequestTotalPriceWidget(),
              const Divider(),
              RequestDetailsIconTextsRow(
                title: AppLocalizations.of(context)!.location,
                description: ' الرياض حي العارض شارع أسماء بنت مالك',
                icon: Icons.location_on,
              ),
              RequestDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.payment_method,
                  description: 'بطاقة إئتمانية',
                  icon: Icons.credit_card,
                  iconColor: ColorManager.greyColor),
              RequestDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.payment_status,
                  description: 'تم الدفع',
                  icon: Icons.check_circle,
                  iconColor: ColorManager.darkGreenColor),
              RequestDetailsIconTextsRow(
                  title: AppLocalizations.of(context)!.warranty_status, description: 'ساري', icon: Icons.verified_user, iconColor: ColorManager.midBlueColor),
              const Divider(),
              SizedBox(height: AppSizes.ph50),
              manageRequestButtons(ColorManager.yellowColor),
              SizedBox(height: AppSizes.ph20),
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
