import 'package:bacura_app/core/utils/index.dart';

class TotalPriceRow extends StatelessWidget {
  const TotalPriceRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(AppLocalizations.of(context)!.total,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryBlueColor,
                fontWeight: FontWeight.bold,
              )),
      Text('2000',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryBlueColor,
                fontWeight: FontWeight.bold,
              ))
    ]);
  }
}
