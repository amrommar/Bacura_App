import 'package:bacura_app/core/utils/index.dart';

class ProfileRowDetails extends StatefulWidget {
  IconData icon;
  String text;
  String value;
  Function() onTap;

  ProfileRowDetails({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
    required this.value,
  });

  @override
  State<ProfileRowDetails> createState() => _ProfileRowDetailsState();
}

class _ProfileRowDetailsState extends State<ProfileRowDetails> {
  ////// Custom Row contain: (Icon - Column : 'text / text' - text)/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(widget.icon, color: ColorManager.primaryBlueColor, size: 30),
      SizedBox(width: 15.w),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorManager.blackColor, fontWeight: FontWeight.w600)),
        Text(widget.value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.greyColor,
                ))
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
