import 'package:bacura_app/core/utils/index.dart';

class OrderDetailsIconTextsRow extends StatelessWidget {
  final String title;
  final String description;
  final IconData? icon;
  final Color iconColor;

  const OrderDetailsIconTextsRow({
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
          borderRadius: BorderRadius.circular(AppSizes.br8),
        ),
        margin: EdgeInsets.only(top: AppSizes.ph4),
        padding: EdgeInsets.symmetric(horizontal: AppSizes.ph8),
        height: AppSizes.ph40,
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
            Icon(icon, size: AppSizes.ph20, color: iconColor)
          ]))
        ]));
  }
}
