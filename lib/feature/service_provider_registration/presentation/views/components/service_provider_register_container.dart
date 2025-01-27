import 'package:bacura_app/core/utils/index.dart';

class ServiceProviderRegisterContainer extends StatelessWidget {
  IconData iconData;
  String title;
  String description;
  String note;
  Function() onTap;

  ServiceProviderRegisterContainer({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.title,
    required this.description,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppSizes.pw8),
          color: ColorManager.whiteColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                color: ColorManager.lightGreyColor,
                size: AppSizes.ph30,
              ),
              SizedBox(width: AppSizes.pw5),
              Text(title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: ColorManager.blackColor,
                      )),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppSizes.ph16),
          margin: EdgeInsets.symmetric(horizontal: AppSizes.pw8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.br8),
            color: ColorManager.midWhiteColor,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.primaryBlueColor,
                    )),
            SizedBox(height: AppSizes.ph10),
            Text(note,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.greyColor,
                    )),
            SizedBox(height: AppSizes.ph26),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      onTap();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.register_now,
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
            SizedBox(height: AppSizes.ph10),
          ]),
        ),
      ],
    );
  }
}
