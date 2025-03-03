import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/index.dart';
import 'package:bacura_app/feature/technician_app/index.dart';

class SpImplementOrderScreen extends StatefulWidget {
  const SpImplementOrderScreen({super.key});

  @override
  State<SpImplementOrderScreen> createState() => _SpImplementOrderScreenState();
}

class _SpImplementOrderScreenState extends State<SpImplementOrderScreen> {
  String buttonText = 'الوصول للعميل';

  final GlobalKey<ImplementOrderPhaseSectionState> phase1Key = GlobalKey();
  final GlobalKey<ImplementOrderPhaseSectionState> phase2Key = GlobalKey();
  final GlobalKey<ImplementOrderPhaseSectionState> phase3Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تنفيذ الطلب')),
      body: Scaffold(
        body: Container(
          height: AppSizes.ph850,
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
            ],
          ),
          margin: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
          padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph12),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    'الطلب رقم: ',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                        ),
                  ),
                  Text(
                    '#3333452',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.darkBlueColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ]),
                const Divider(),
                const OrderTimeDateWidget(date: '10/10/2023', time: '10:00 AM'),
                const Divider(),
                SizedBox(height: AppSizes.ph10),
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
                SizedBox(height: AppSizes.ph20),
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.soLightWhiteColor,
                    borderRadius: BorderRadius.circular(AppSizes.br8),
                  ),
                  padding: EdgeInsets.all(AppSizes.ph16),
                  child: Column(
                    children: [
                      ImplementOrderPhaseSection(
                        key: phase1Key,
                        title: 'تم تجهيز المواد',
                        time: '12:05 ص',
                        isLast: false,
                        initialCompleted: true,
                      ),
                      ImplementOrderPhaseSection(
                        key: phase2Key,
                        title: 'الوصول للعميل',
                        time: '2:05 م',
                        isLast: false,
                        initialCompleted: false,
                      ),
                      ImplementOrderPhaseSection(
                        key: phase3Key,
                        title: 'تم التنفيذ',
                        time: '4:05 م',
                        isLast: true,
                        initialCompleted: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.ph30),
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
                    : SizedBox(height: AppSizes.ph50),
                SizedBox(height: AppSizes.ph50),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.br8),
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
