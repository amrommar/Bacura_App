import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomMyDetailsWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool hasDivider;

  const CustomMyDetailsWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.hasDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppSizes.pw16,
            right: AppSizes.pw16,
            top: AppSizes.pw8,
          ),
          child: Container(
            padding: EdgeInsets.all(AppSizes.ph16),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).inputDecorationTheme.enabledBorder!.borderSide.color,
              ),
              borderRadius: BorderRadius.circular(AppSizes.br4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: AppSizes.sp14,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      Text(
                        subTitle,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: AppSizes.sp14,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
