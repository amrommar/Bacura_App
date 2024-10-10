import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class Custom_More_row extends StatelessWidget {
  String text;
  Function onTap;
  IconData icon;

  Custom_More_row({
    required this.text,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppPadding.p12,
        right: AppPadding.p12,
        top: AppPadding.p12,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              onTap();
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ColorManager.blackColor)),
                ),
                Icon(
                  icon,
                  size: 20,
                  color: ColorManager.primaryBlueColor,
                ),
              ],
            ),
          ),
          Divider(
            color: ColorManager.lightBlueColor,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
