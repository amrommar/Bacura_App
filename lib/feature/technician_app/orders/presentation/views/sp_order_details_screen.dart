import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/presentation/components/custom_shadow_row_widget.dart';
import 'package:bacura_app/feature/technician_app/orders/controller/sp_order_details_provider.dart';
import 'package:bacura_app/feature/technician_app/orders/presentation/views/sp_implement_order_screen.dart';

class SpOrderDetailsScreen extends StatelessWidget {
  final int? orderId;
  final String? date;
  final String? time;
  final String? clientName;
  final String? serviceName;
  final double? longitude;
  final double? latitude;
  final String? mobileNumber;
  final int id;
  final String phoneNumber;

  const SpOrderDetailsScreen(
      {super.key,
      this.orderId,
      this.date,
      this.time,
      this.clientName,
      this.serviceName,
      this.longitude,
      this.latitude,
      this.mobileNumber,
      required this.phoneNumber,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.request_details)),
      body: ChangeNotifierProvider(
        create: (context) => SpOrderDetailsProvider(id: orderId!),
        child: Consumer<SpOrderDetailsProvider>(
          builder: (context, provider, child) {
            return provider.isItemsLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
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
                    height: 800.h,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ////  Request Number  section/////////////////////////////////////////////

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الطلب رقم: ',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: ColorManager.darkBlueColor,
                                    ),
                              ),
                              Text(
                                '#$orderId',
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: ColorManager.darkBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const Divider(),
                          ////Time and Date section/////////////////////////////////////////////
                          OrderTimeDateWidget(date: date ?? '10/10/2010', time: time ?? '10:10'),
                          const Divider(),
                          SizedBox(height: AppSizes.ph10),
                          Row(
                            children: [
                              Text('اسم العميل: ',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: ColorManager.darkBlueColor,
                                      )),
                              Text(
                                clientName ?? 'عميل',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: ColorManager.primaryBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.ph5),

                          /// Request Details section/////////////////////////////////////////////
                          if (provider.itemsForOrderEntity.isNotEmpty)
                            Container(
                              padding: EdgeInsets.all(AppSizes.ph15),
                              margin: EdgeInsets.symmetric(vertical: AppSizes.ph12),
                              decoration: BoxDecoration(
                                color: ColorManager.lightBlueColor,
                                borderRadius: BorderRadius.circular(AppSizes.br8),
                              ),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                      child: Text(provider.itemsForOrderEntity[index]?.name ?? '',
                                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                                color: ColorManager.blackColor,
                                              )));
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return Divider(
                                    color: ColorManager.whiteColor,
                                  );
                                },
                                itemCount: provider.itemsForOrderEntity.length,
                              ),
                            ),

                          /// Total Money section/////////////////////////////////////////////
                          Text(serviceName ?? 'اسم الخدمة',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ColorManager.primaryBlueColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                          const Divider(),

                          ///  location section/////////////////////////////////////////////
                          InkWell(
                            onTap: () {
                              _openGoogleMaps(latitude: latitude!, longitude: longitude!); // Example coordinates
                            },
                            child: Image.asset(
                              'assets/images/map2.jpeg',
                              height: AppSizes.ph200,
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                            ),
                          ),

                          ///  Payment status section/////////////////////////////////////////////

                          const Divider(),
                          SizedBox(height: AppSizes.ph30),
                          InkWell(
                            onTap: () => _makePhoneCall(phoneNumber),
                            child: CustomShadowRowWidget(
                              widget: Text('الاتصال بالعميل',
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                        color: ColorManager.darkBlueColor,
                                      )),
                              icon: Icons.call_outlined,
                            ),
                          ),

                          SizedBox(height: AppSizes.ph30),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.br8,
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SpImplementOrderScreen(
                                    time: time,
                                    clientName: clientName,
                                    date: date,
                                    orderId: orderId,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'الوصول للعميل',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ColorManager.whiteColor,
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
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> _openGoogleMaps({required double latitude, required double longitude}) async {
  final Uri googleMapsWebUri = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

  if (await canLaunchUrl(googleMapsWebUri)) {
    await launchUrl(googleMapsWebUri, mode: LaunchMode.externalApplication);
  } else {
    print("Could not open Google Maps.");
  }
}
