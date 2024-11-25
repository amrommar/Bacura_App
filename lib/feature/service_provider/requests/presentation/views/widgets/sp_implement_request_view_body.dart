import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:bacura_app/feature/request_services/presentation/views/widgets/custom_shadow_container_row.dart';
import 'package:bacura_app/feature/requests/presetation/views/widgets/request_time_date.dart';
import 'package:bacura_app/feature/service_provider/home/presentation/views/widgets/sp_request_num_row.dart';
import 'package:bacura_app/feature/service_provider/requests/presentation/views/widgets/implement_request_phase_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SpImplementRequestViewBody extends StatefulWidget {
  const SpImplementRequestViewBody({super.key});

  @override
  State<SpImplementRequestViewBody> createState() => _SpImplementRequestViewBodyState();
}

class _SpImplementRequestViewBodyState extends State<SpImplementRequestViewBody> {
  String buttonText = 'الوصول للعميل';

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
              RequestTimeDate(),
              const Divider(),
              SizedBox(height: 10.h),
              Row(children: [
                Text('اسم العميل: ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                        )),
                Text('محمد صلاح',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.primaryBlueColor,
                          fontWeight: FontWeight.bold,
                        ))
              ]),
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.lightWhiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ImplementRequestPhaseSection(
                      title: 'تم تجهيز المواد',
                      time: '12:05 ص',
                      isLast: false,
                      initialCompleted: true,
                      onToggle: (bool isCompleted) {
                        buttonText = 'الوصول للعميل';
                      },
                    ),
                    ImplementRequestPhaseSection(
                      title: 'الوصول للعميل',
                      time: '2:05 م',
                      isLast: false,
                      initialCompleted: false,
                      onToggle: (bool isCompleted) {
                        buttonText = 'تم التنفيذ';
                        setState(() {});
                        isCompleted == true;
                      },
                    ),
                    ImplementRequestPhaseSection(
                      title: 'تم التنفيذ',
                      time: '4:05 م',
                      isLast: true,
                      initialCompleted: false,
                      onToggle: (bool isCompleted) {
                        buttonText = 'إغلاق الطلب';
                        setState(() {});
                        isCompleted == true;
                      },
                    ),
                    SizedBox(height: 30.h),
                    Text('تركيب وبرمجة',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ColorManager.blackColor,
                              fontWeight: FontWeight.bold,
                            )),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              buttonText == 'الوصول للعميل'
                  ? InkWell(
                      onTap: () => _makePhoneCall('0536885692'),
                      child: CustomShadowContainerRow(
                        widget: Text('الاتصال بالعميل ',
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ColorManager.darkBlueColor,
                                )),
                        icon: Icons.call_outlined,
                      ),
                    )
                  : SizedBox(height: 50.h),
              SizedBox(height: 50.h),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                    AppSize.s8,
                  ))),
                  onPressed: () {
                    if (buttonText == 'إغلاق الطلب') {
                      Navigator.pushNamed(context, Routes.spHomeScreenRoute);
                    }
                  },
                  child: Text(buttonText,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.whiteColor,
                          ))),
            ])));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
