import 'package:bacura_app/core/utils/index.dart';

class TotalPriceWidget extends StatelessWidget {
  String price;

  TotalPriceWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(tr(AppStrings.offerPrice),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryBlueColor,
                fontWeight: FontWeight.bold,
              )),
      Text(price,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryBlueColor,
                fontWeight: FontWeight.bold,
              ))
    ]);
  }
}
