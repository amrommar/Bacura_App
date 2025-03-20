import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/orders/controller/sp_order_details_provider.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/screen/index.dart';

class SpImplementOrderScreen extends StatefulWidget {
  final int? orderId;
  final String? date;
  final String? time;
  final String? clientName;

  SpImplementOrderScreen({
    super.key,
    this.orderId,
    this.date,
    this.time,
    this.clientName,
  });

  @override
  State<SpImplementOrderScreen> createState() => _SpImplementOrderScreenState();
}

class _SpImplementOrderScreenState extends State<SpImplementOrderScreen> {
  String buttonText = 'تم التنفيذ';

  final GlobalKey<ImplementOrderPhaseSectionState> phase1Key = GlobalKey();

  final GlobalKey<ImplementOrderPhaseSectionState> phase2Key = GlobalKey();

  final GlobalKey<ImplementOrderPhaseSectionState> phase3Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تنفيذ الطلب')),
      body: ChangeNotifierProvider(
        create: (context) => SpOrderDetailsProvider(id: widget.orderId!),
        child: Consumer<SpOrderDetailsProvider>(builder: (context, provider, child) {
          return provider.isItemsLoading
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  body: Container(
                    height: AppSizes.ph850,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(
                        AppSizes.br12,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.midWhiteColor,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.pw12,
                      vertical: AppSizes.ph12,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.pw12,
                      vertical: AppSizes.ph12,
                    ),
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
                              '#${widget.orderId}',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ColorManager.darkBlueColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ]),
                          const Divider(),
                          OrderTimeDateWidget(date: widget.date!, time: widget.time!),
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
                                widget.clientName!,
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
                                  isLast: false,
                                  initialCompleted: true,
                                ),
                                ImplementOrderPhaseSection(
                                  key: phase2Key,
                                  title: 'الوصول للعميل',
                                  isLast: false,
                                  initialCompleted: true,
                                ),
                                ImplementOrderPhaseSection(
                                  key: phase3Key,
                                  title: 'تم التنفيذ',
                                  isLast: true,
                                  initialCompleted: false,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.ph30),
                          SizedBox(height: AppSizes.ph50),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSizes.br8),
                                ),
                              ),
                              onPressed: () {
                                if (buttonText == 'تم التنفيذ') {
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
                );
        }),
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
