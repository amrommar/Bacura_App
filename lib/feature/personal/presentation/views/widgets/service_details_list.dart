import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/feature/personal/presentation/views/widgets/request_details_price_row.dart';
import 'package:flutter/material.dart';

class ServiceDetailsList extends StatelessWidget {
  const ServiceDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorManager.soLightWhiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const RequestDetailsPriceRow();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: ColorManager.lightBlueColor,
          );
        },
        itemCount: 4,
      ),
    );
  }
}
