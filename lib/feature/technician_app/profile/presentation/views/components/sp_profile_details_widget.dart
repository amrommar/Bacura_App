import 'package:bacura_app/core/utils/index.dart';

class SpProfileDetailsWidget extends StatefulWidget {
  IconData icon;
  String text;
  String value;

  SpProfileDetailsWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  State<SpProfileDetailsWidget> createState() => _SpProfileDetailsWidgetState();
}

class _SpProfileDetailsWidgetState extends State<SpProfileDetailsWidget> {
  ////// Custom Row contain: (Icon - Column : 'text / text' - text)/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        widget.icon,
        color: ColorManager.primaryBlueColor,
        size: AppSizes.ph30,
      ),
      SizedBox(width: AppSizes.pw16),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorManager.blackColor, fontWeight: FontWeight.w600)),
        Text(
          widget.value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorManager.greyColor,
              ),
          textDirection: TextDirection.ltr,
        ),
      ]),
    ]);
  }
}
