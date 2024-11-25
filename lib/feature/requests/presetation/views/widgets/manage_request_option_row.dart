import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ManageRequestOptionRow extends StatelessWidget {
  String text;
  IconData icon;
  Color iconColor;
  Function onTap;

  ManageRequestOptionRow({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              child: Text(text,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      ))),
          Icon(
            icon,
            size: 30,
            color: iconColor,
          )
        ]));
  }
}
