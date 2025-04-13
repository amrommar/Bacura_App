import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.radius,
    this.fit = BoxFit.contain,
    this.color,
    this.withDefaultColor = false,
  });

  CustomSvgImage.square({
    Key? key,
    required String path,
    Color? color,
    double? size,
    bool withDefaultColor = false,
  }) : this(
          withDefaultColor: withDefaultColor,
          key: key,
          path: path,
          height: size ?? AppSizes.pw100,
          width: size ?? AppSizes.pw100,
          color: color,
          radius: BorderRadius.circular(AppSizes.br8),
        );

  CustomSvgImage.icons({
    Key? key,
    required String path,
    Color? color,
  }) : this(
          key: key,
          path: path,
          height: AppSizes.ph21_5,
          width: AppSizes.ph21_5,
          radius: BorderRadius.zero,
          fit: BoxFit.scaleDown,
          color: color,
        );

  final String path;
  final double? height;
  final double? width;
  final Color? color;
  final BorderRadius? radius;
  final BoxFit fit;
  final bool withDefaultColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: SvgPicture.asset(
        path,
        height: height,
        width: width,
        colorFilter: withDefaultColor
            ? null
            : ColorFilter.mode(
                color ?? (Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
                BlendMode.srcIn, // Blend mode for coloring
              ),
        fit: fit,
      ),
    );
  }
}
