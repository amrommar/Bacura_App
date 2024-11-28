import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class Custom_More_row extends StatelessWidget {
  String text;
  Function onTap;
  IconData icon;
  Widget widget;

  Custom_More_row({
    super.key,
    required this.widget,
    required this.text,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        padding: const EdgeInsets.all(12),
        child: InkWell(
            onTap: () {
              onTap();
            },
            child: Row(children: [
              widget,
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 4, left: 4, top: 3),
                child: Text(text,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.blackColor,
                        )),
              )),
              Icon(
                icon,
                size: 20,
                color: ColorManager.primaryBlueColor,
              )
            ])));
  }
}
