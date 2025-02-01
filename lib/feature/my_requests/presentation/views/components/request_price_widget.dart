import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class RequestPriceWidget extends StatelessWidget {
  const RequestPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('1000 ريال',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorManager.darkBlueColor,
                  fontWeight: FontWeight.bold,
                )),
      ],
    );
  }
}
