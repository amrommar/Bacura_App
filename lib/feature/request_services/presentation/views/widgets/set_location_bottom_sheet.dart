import 'package:bacura_app/core/utils/index.dart';

class SetLocationBottomSheet extends StatefulWidget {
  var locationController = TextEditingController();

  SetLocationBottomSheet({super.key, required this.locationController});

  @override
  State<SetLocationBottomSheet> createState() => _SetLocationBottomSheetState();
}

class _SetLocationBottomSheetState extends State<SetLocationBottomSheet> {
  String locationAddress = 'Pick Location';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      width: double.infinity,
      color: Colors.white,
      child: OpenStreetMapSearchAndPick(
          buttonColor: ColorManager.primaryBlueColor,
          buttonText: AppLocalizations.of(context)!.set_current_location,
          locationPinIconColor: ColorManager.darkRedColor,
          buttonWidth: 200.w,
          locationPinTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.primaryBlueColor),
          onPicked: (pickedData) {
            try {
              Navigator.pop(context);
              setState(() {
                locationAddress = pickedData.addressName;
                widget.locationController.text = locationAddress;
              });
            } catch (e) {
              print('Error: $e');
            }
          }),
    );
  }
}
