import 'package:bacura_app/core/utils/index.dart';

class ConsultationNoteWidget extends StatelessWidget {
  const ConsultationNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        '*',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.greyColor),
      ),
      SizedBox(width: 10.w),
      Expanded(
        child: Text('سيتم الرد على استشارتك خلال ثلاثة أيام.',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor)),
      )
    ]);
  }
}
