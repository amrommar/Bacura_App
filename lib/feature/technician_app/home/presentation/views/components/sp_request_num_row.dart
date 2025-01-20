import 'package:bacura_app/core/utils/index.dart';

class SpRequestNumRow extends StatelessWidget {
  const SpRequestNumRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        'الطلب رقم: ',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorManager.darkBlueColor,
            ),
      ),
      Text(
        '#3333452',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: ColorManager.darkBlueColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    ]);
  }
}
