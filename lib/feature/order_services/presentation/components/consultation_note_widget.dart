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
      SizedBox(width: AppSizes.pw10),
      Expanded(
        child: Text(tr(AppStrings.yourConsultationWillBeReplied),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor)),
      )
    ]);
  }
}
