import 'package:bacura_app/core/utils/index.dart';

class SpProfileRowDetails extends StatefulWidget {
  IconData icon;
  String text;
  String value;

  SpProfileRowDetails({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  State<SpProfileRowDetails> createState() => _SpProfileRowDetailsState();
}

class _SpProfileRowDetailsState extends State<SpProfileRowDetails> {
  ////// Custom Row contain: (Icon - Column : 'text / text' - text)/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        widget.icon,
        color: ColorManager.primaryBlueColor,
        size: 30,
      ),
      SizedBox(width: 30.w),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ColorManager.blackColor,
                  fontWeight: FontWeight.w600,
                )),
        Text(widget.value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorManager.greyColor,
                ))
      ]),
    ]);
  }
}
