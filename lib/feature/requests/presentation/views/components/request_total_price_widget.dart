import 'package:bacura_app/core/utils/index.dart';

class RequestTotalPriceWidget extends StatelessWidget {
  const RequestTotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
          left: AppSizes.pw8,
          right: AppSizes.pw8,
          top: AppSizes.ph8,
        ),
        height: 40.h,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(AppLocalizations.of(context)!.total,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
          Text('2000 ريال',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryBlueColor,
                  ))
        ]));
  }
}
