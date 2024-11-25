import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

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
