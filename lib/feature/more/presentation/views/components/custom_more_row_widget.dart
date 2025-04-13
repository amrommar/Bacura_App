import 'package:bacura_app/core/utils/index.dart';

class CustomMoreRowWidget extends StatelessWidget {
  String text;
  Function onTap;
  IconData icon;
  Widget widget;

  CustomMoreRowWidget({
    super.key,
    required this.widget,
    required this.text,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(AppSizes.br8),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.pw8,
          vertical: AppSizes.ph3,
        ),
        padding: EdgeInsets.all(AppSizes.br12),
        child: InkWell(
            onTap: () {
              onTap();
            },
            child: Row(children: [
              widget,
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(
                  right: AppSizes.pw4,
                  left: AppSizes.pw4,
                  top: AppSizes.ph3,
                ),
                child: Text(text,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.blackColor,
                        )),
              )),
              Icon(
                icon,
                size: AppSizes.ph20,
                color: ColorManager.primaryBlueColor,
              )
            ])));
  }
}
