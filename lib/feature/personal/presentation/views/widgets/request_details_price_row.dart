import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class RequestDetailsPriceRow extends StatelessWidget {
  const RequestDetailsPriceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            child: Text('كاميرا IP خارجية 8MP 80m - كاميرا IP خارجية Hikvision 8MP 80m',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.blackColor,
                    ))),
        Text('1000 ريال',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.darkRedColor,
                ))
      ]),
    ]);
  }
}
