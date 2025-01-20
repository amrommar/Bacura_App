import 'package:bacura_app/core/utils/index.dart';

class CustomShadowRowWidget extends StatelessWidget {
  Widget widget;
  IconData icon;

  CustomShadowRowWidget({super.key, required this.widget, this.icon = Icons.circle_outlined});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorManager.lightBlueColor,
                // Shadow color with opacity
                spreadRadius: 2, // Spread radius
                blurRadius: 4, // Blur radius
                offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.whiteColor,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: widget,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: ColorManager.midBlueColor,
                    size: 30,
                  ))
            ]));
  }
}
