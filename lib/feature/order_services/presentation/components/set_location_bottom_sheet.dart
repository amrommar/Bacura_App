import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/order_services/presentation/controller/order_services_provider.dart';

class SetLocationBottomSheet extends StatelessWidget {
  final TextEditingController locationController;
  double latitude;
  double longitude;

  SetLocationBottomSheet({
    super.key,
    required this.locationController,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderServicesProvider>(
      builder: (context, provider, child) => Container(
        height: AppSizes.ph600,
        width: double.infinity,
        color: Colors.white,
        child: OpenStreetMapSearchAndPick(
          buttonColor: ColorManager.primaryBlueColor,
          buttonText: AppLocalizations.of(context)!.set_current_location,
          locationPinIconColor: ColorManager.darkRedColor,
          buttonWidth: AppSizes.pw200,
          locationPinTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor),
          onPicked: (pickedData) {
            try {
              Navigator.pop(context, {
                'latitude': pickedData.latLong.latitude,
                'longitude': pickedData.latLong.longitude,
                'address': pickedData.addressName,
              });
            } catch (e) {
              print('Error: $e');
            }
          },
        ),
      ),
    );
  }
}
