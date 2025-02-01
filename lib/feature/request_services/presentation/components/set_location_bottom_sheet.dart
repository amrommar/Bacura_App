import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/request_services/presentation/controller/request_services_provider.dart';

class SetLocationBottomSheet extends StatelessWidget {
  const SetLocationBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RequestServicesProvider>(
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
                Navigator.pop(context);

                provider.locationController.text = pickedData.addressName;
                provider.latitude = pickedData.latLong.latitude;
                provider.longitude = pickedData.latLong.longitude;
              } catch (e) {
                print('Error: $e');
              }
            }),
      ),
    );
  }
}
