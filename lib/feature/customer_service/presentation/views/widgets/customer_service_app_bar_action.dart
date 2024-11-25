import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomerServiceAppBarAction extends StatefulWidget {
  const CustomerServiceAppBarAction({super.key});

  @override
  State<CustomerServiceAppBarAction> createState() => _CustomerServiceAppBarActionState();
}

class _CustomerServiceAppBarActionState extends State<CustomerServiceAppBarAction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
                padding: const EdgeInsets.all(5),
                color: ColorManager.whiteColor,
                child: Icon(
                  Icons.headset_mic_outlined,
                  size: 30,
                  color: ColorManager.primaryBlueColor,
                ))));
  }
}
