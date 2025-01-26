import 'package:bacura_app/core/utils/index.dart';

class CustomSupportContainerWidget extends StatelessWidget {
  String text;
  Function onTap;
  IconData icon;
  Widget widget;

  CustomSupportContainerWidget({
    super.key,
    required this.widget,
    required this.text,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSizes.ph160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.lightWhiteColor,
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        margin: EdgeInsets.symmetric(horizontal: AppSizes.pw8, vertical: AppSizes.ph5),
        padding: EdgeInsets.all(AppSizes.ph12),
        child: InkWell(
            onTap: () {
              onTap();
            },
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              widget,
              SizedBox(height: AppSizes.ph5),
              Padding(
                padding: EdgeInsets.only(right: AppSizes.pw4, left: AppSizes.pw4, top: AppSizes.ph3),
                child: Text(text,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: ColorManager.blackColor,
                        )),
              )
            ])));
  }
}
