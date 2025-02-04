import 'package:bacura_app/core/utils/index.dart';

class CustomOfferContainerWidget extends StatelessWidget {
  final String imagePath, name, cost, expireDate;
  const CustomOfferContainerWidget(
      {super.key, required this.imagePath, required this.name, required this.cost, required this.expireDate});

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
                  ))),
          Padding(
            padding: EdgeInsets.all(AppSizes.ph6),
            child: Column(
              children: [
                SizedBox(
                    width: AppSizes.pw150,
                    child: Text(name,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorManager.blackColor, fontSize: AppSizes.sp14),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSizes.ph6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///////////////    from Back-End     /////////////////////
                Text(expireDate,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorManager.darkRedColor,
                          fontSize: AppSizes.sp12,
                        )),
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
