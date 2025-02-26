import 'package:bacura_app/core/utils/index.dart';

class CustomOfferContainerWidget extends StatelessWidget {
  final String imagePath, title, cost, expireDate, content;

  const CustomOfferContainerWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.cost,
      required this.expireDate,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.br8),
        color: ColorManager.midWhiteColor,
      ),
      margin: EdgeInsets.symmetric(horizontal: AppSizes.pw12, vertical: AppSizes.ph6),
      height: AppSizes.ph116,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: AppSizes.ph111,
            width: AppSizes.pw150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.br8),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: AppSizes.pw170,
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pw6, vertical: AppSizes.ph12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorManager.blackColor, fontSize: AppSizes.sp14),
                    overflow: TextOverflow.ellipsis),
                Expanded(
                  child: Text(content,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: ColorManager.greyColor, fontSize: AppSizes.sp12),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pw6, vertical: AppSizes.ph12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  expireDate,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.darkRedColor,
                        fontSize: AppSizes.sp12,
                      ),
                ),
                Text(
                  cost,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.darkRedColor,
                        fontWeight: FontWeight.bold,
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
