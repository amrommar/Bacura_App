import 'package:bacura_app/core/utils/index.dart';

class RequestDetailsIconTextsRow extends StatelessWidget {
  String title;
  String description;
  IconData? icon;
  Color iconColor;

  RequestDetailsIconTextsRow({
    super.key,
    required this.title,
    required this.description,
    this.icon,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.soLightWhiteColor,
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        margin: EdgeInsets.only(top: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: 40.h,
        child: Row(children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold)),
          Expanded(
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Text(description,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorManager.primaryBlueColor,
                        ))),
            Icon(icon, size: 20, color: iconColor)
          ]))
        ]));
  }
}
