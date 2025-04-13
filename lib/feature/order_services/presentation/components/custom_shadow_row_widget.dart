import 'package:bacura_app/core/utils/index.dart';

class CustomShadowRowWidget extends StatelessWidget {
  Widget widget;
  IconData icon;

  CustomShadowRowWidget({super.key, required this.widget, this.icon = Icons.circle_outlined});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph6),
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.pw16,
          vertical: AppSizes.ph6,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorManager.lightBlueColor,
                // Shadow color with opacity
                spreadRadius: 2, // Spread radius
                blurRadius: 4, // Blur radius
                offset: const Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(AppSizes.br12),
          color: ColorManager.whiteColor,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.pw12),
                child: widget,
              ),
              Padding(
                  padding: EdgeInsets.all(AppSizes.ph8),
                  child: Icon(
                    icon,
                    color: ColorManager.midBlueColor,
                    size: AppSizes.ph30,
                  ))
            ]));
  }
}
