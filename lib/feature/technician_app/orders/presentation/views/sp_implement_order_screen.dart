import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/technician_app/orders/presentation/controller/sp_order_details_provider.dart';
import 'package:bacura_app/feature/technician_app/profile/presentation/views/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey<ImplementOrderPhaseSectionState> phase1Key = GlobalKey();
  final GlobalKey<ImplementOrderPhaseSectionState> phase2Key = GlobalKey();
  final GlobalKey<ImplementOrderPhaseSectionState> phase3Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(AppStrings.implementOrder))),
      body: ChangeNotifierProvider(
        create: (context) => SpOrderDetailsProvider(id: widget.orderId!),
        child: Consumer<SpOrderDetailsProvider>(
          builder: (context, provider, child) {
            return provider.isItemsLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tr(AppStrings.orderId),
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
                            ],
                          ),
                          const Divider(),
                          OrderTimeDateWidget(date: widget.date!, time: widget.time!),
                          const Divider(),
                          SizedBox(height: AppSizes.ph10),
                          Row(
                            children: [
                              Text(
                                tr(AppStrings.clientName),
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
                                  title: tr(AppStrings.materialsPrepared),
                                  isLast: false,
                                  initialCompleted: provider.phase1Completed,
                                ),
                                ImplementOrderPhaseSection(
                                  key: phase2Key,
                                  title: tr(AppStrings.accessToClient),
                                  isLast: false,
                                  initialCompleted: provider.phase2Completed,
                                ),
                                ImplementOrderPhaseSection(
                                  key: phase3Key,
                                  title: tr(AppStrings.orderDone),
                                  isLast: true,
                                  initialCompleted: provider.phase3Completed,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: AppSizes.ph30),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSizes.br8),
                                ),
                              ),
                              onPressed: () {
                                provider.cancelOrder(context: context);
                              },
                              child: Text(
                                provider.buttonText,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: ColorManager.whiteColor,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
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
