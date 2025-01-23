import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpRequestDetailsScreen extends StatefulWidget {
  @override
  State<SpRequestDetailsScreen> createState() => _SpRequestDetailsScreenState();
}

class _SpRequestDetailsScreenState extends State<SpRequestDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.request_details)),
      body: Container(
          decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(AppSize.s12),
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
                ////  Request Number  section/////////////////////////////////////////////

                const SpRequestNumRow(),
                const Divider(),
                ////Time and Date section/////////////////////////////////////////////
                const RequestTimeDateWidget(),
                const Divider(),
                SizedBox(height: 10.h),
                const CustomerNameWidget(),
                SizedBox(height: 5.h),

                /// Request Details section/////////////////////////////////////////////
                const CustomerRequestDetailsWidget(),

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
              ]))),
    );
  }
}
