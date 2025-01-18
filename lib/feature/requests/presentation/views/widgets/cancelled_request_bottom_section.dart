import 'package:bacura_app/core/utils/index.dart';

class CancelledRequestBottomSection extends StatelessWidget {
  const CancelledRequestBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(AppLocalizations.of(context)!.request_cancelled,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorManager.darkRedColor,
                fontWeight: FontWeight.w500,
              )),
      SizedBox(height: 10.h),
      Icon(
        Icons.cancel,
        color: ColorManager.darkRedColor,
        size: 50,
      )
    ]);
  }
}
