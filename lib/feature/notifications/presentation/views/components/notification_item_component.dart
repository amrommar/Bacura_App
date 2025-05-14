import 'package:bacura_app/core/utils/index.dart';

class NotificationItemComponent extends StatelessWidget {
  final String title;
  final String body;
  final bool isRead;

  const NotificationItemComponent({
    super.key,
    required this.title,
    required this.body,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isRead ? ColorManager.whiteColor : ColorManager.lightBlueColor,
      height: AppSizes.ph92,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.pw10,
      ),
      child: Row(
        children: [
          const NotificationImageWidget(),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.ph15,
            ),
            child: VerticalDivider(
              color: ColorManager.soLightGreyColor,
            ),
          ),
          Container(
            width: AppSizes.pw320,
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.ph8,
              horizontal: AppSizes.pw4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                      ),
                ),
                Text(
                  body,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.greyColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
