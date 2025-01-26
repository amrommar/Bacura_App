import 'package:bacura_app/core/utils/index.dart';

class CustomShadowWidget extends StatelessWidget {
  Widget childWidget;

  CustomShadowWidget({super.key, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pw16, vertical: AppSizes.ph16),
        margin: EdgeInsets.all(AppSizes.ph12),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3) // Offset in the x and y directions
              )
        ], borderRadius: BorderRadius.circular(AppSizes.br12), color: ColorManager.whiteColor),
        child: childWidget);
  }
}
