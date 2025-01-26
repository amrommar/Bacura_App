import 'package:bacura_app/core/utils/app_sizes.dart';
import 'package:bacura_app/core/utils/index.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingShimmer extends StatelessWidget {
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final double width;
  final double height;

  const CustomLoadingShimmer({
    super.key,
    this.borderRadius,
    required this.width,
    required this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: color != null ? color!.withOpacity(0) : ColorManager.greyColor.withOpacity(0),
      baseColor: Theme.of(context).cardColor,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color ?? ColorManager.greyColor,
          borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.br8),
        ),
      ),
    );
  }
}
