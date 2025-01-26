import 'package:bacura_app/core/presentation/images/custom_svg_image.dart';
import 'package:bacura_app/core/utils/app_assets.dart';
import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class HeaderModalBottomSheetDefault extends StatelessWidget {
  const HeaderModalBottomSheetDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: CustomSvgImage.icons(
                  path: AppAssets.closeSquare,
                  color: Theme.of(context).iconTheme.color,
                )),
            Container(
              width: AppSizes.pw5,
              height: AppSizes.ph3,
              color: Theme.of(context).iconTheme.color,
            ),
            SizedBox(width: AppSizes.ph35),
          ],
        ),
        SizedBox(height: AppSizes.ph3),
      ],
    );
  }
}
