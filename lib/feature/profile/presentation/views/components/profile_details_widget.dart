import 'package:bacura_app/core/utils/index.dart';

class ProfileDetailsWidget extends StatefulWidget {
  IconData icon;
  String text;
  String value;
  Function() onTap;

  ProfileDetailsWidget({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
    required this.value,
  });

  @override
  State<ProfileDetailsWidget> createState() => _ProfileDetailsWidgetState();
}

class _ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
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
      const Spacer(),
      InkWell(
          onTap: widget.onTap,
          child: Text(AppLocalizations.of(context)!.edit,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  )))
    ]);
  }
}
