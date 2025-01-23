import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/request_services/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpImplementRequestScreen extends StatefulWidget {
  const SpImplementRequestScreen({super.key});

  @override
  State<SpImplementRequestScreen> createState() => _SpImplementRequestScreenState();
}

class _SpImplementRequestScreenState extends State<SpImplementRequestScreen> {
  String buttonText = 'الوصول للعميل';

  final GlobalKey<ImplementRequestPhaseSectionState> phase1Key = GlobalKey();
  final GlobalKey<ImplementRequestPhaseSectionState> phase2Key = GlobalKey();
  final GlobalKey<ImplementRequestPhaseSectionState> phase3Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تنفيذ الطلب')),
      body: Scaffold(
        body: Container(
          height: 850.h,
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
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpRequestNumRow(),
                const Divider(),
                const RequestTimeDateWidget(),
                const Divider(),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      'اسم العميل: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.darkBlueColor,
                          ),
                    ),
                    Text(
                      'محمد صلاح',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.soLightWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ImplementRequestPhaseSection(
                        key: phase1Key,
                        title: 'تم تجهيز المواد',
                        time: '12:05 ص',
                        isLast: false,
                        initialCompleted: true,
                      ),
                      ImplementRequestPhaseSection(
                        key: phase2Key,
                        title: 'الوصول للعميل',
                        time: '2:05 م',
                        isLast: false,
                        initialCompleted: false,
                      ),
                      ImplementRequestPhaseSection(
                        key: phase3Key,
                        title: 'تم التنفيذ',
                        time: '4:05 م',
                        isLast: true,
                        initialCompleted: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                buttonText == 'الوصول للعميل'
                    ? InkWell(
                        onTap: () => _makePhoneCall('0536885692'),
                        child: CustomShadowRowWidget(
                          widget: Text('الاتصال بالعميل ',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ColorManager.darkBlueColor,
                                  )),
                          icon: Icons.call_outlined,
                        ),
                      )
                    : SizedBox(height: 50.h),
                SizedBox(height: 50.h),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                      ),
                    ),
                    onPressed: () {
                      if (buttonText == 'الوصول للعميل') {
                        phase2Key.currentState?.setCompleted(true);
                        buttonText = 'تم التنفيذ';
                      } else if (buttonText == 'تم التنفيذ') {
                        phase3Key.currentState?.setCompleted(true);
                        buttonText = 'إغلاق الطلب';
                      } else if (buttonText == 'إغلاق الطلب') {
                        Navigator.pushNamed(context, Routes.spHomeScreenRoute);
                      }
                      setState(() {});
                    },
                    child: Text(
                      buttonText,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.whiteColor,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}

// Custom dashed line painter
