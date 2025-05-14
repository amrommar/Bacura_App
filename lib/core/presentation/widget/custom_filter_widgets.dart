import 'package:bacura_app/core/utils/index.dart';

class SelectedFilterWidgets extends StatelessWidget {
  String text;
  Color backgroundColor;

  SelectedFilterWidgets({
    super.key,
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.pw4,
          vertical: AppSizes.ph2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw8,
          vertical: AppSizes.ph6,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightGreyColor,
              spreadRadius: 0,
              blurRadius: 1,
              offset: Offset(0, 1),
            )
          ],
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            Icons.check_circle,
            size: AppSizes.ph20,
            color: ColorManager.whiteColor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.pw4,
              vertical: AppSizes.ph1,
            ),
            child: Text(text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.whiteColor,
                    )),
          )
        ]));
  }
}

class UnSelectedFilterContainer extends StatelessWidget {
  String text;

  UnSelectedFilterContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.pw4,
          vertical: AppSizes.ph2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw8,
          vertical: AppSizes.ph6,
        ),
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            border: Border.all(color: ColorManager.soLightGreyColor),
            borderRadius: BorderRadius.circular(AppSizes.br20)),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.pw4,
              vertical: AppSizes.ph1,
            ),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.soLightGreyColor,
                  ),
            )));
  }
}

class FilterIcon extends StatelessWidget {
  Function() onTap;

  FilterIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    /// filter icon //////

    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.pw4,
          vertical: AppSizes.ph2_5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw8,
          vertical: AppSizes.ph6,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 1),
            )
          ],
          color: ColorManager.primaryBlueColor,
          borderRadius: BorderRadius.circular(
            AppSizes.br16,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Icon(
            Icons.filter_list_outlined,
            size: AppSizes.ph24,
            color: ColorManager.whiteColor,
          ),
        ));
  }
}
