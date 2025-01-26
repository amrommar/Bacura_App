import 'package:bacura_app/core/utils/index.dart';

class OffersCardWidget extends StatelessWidget {
  const OffersCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(AppSizes.br12),
          color: ColorManager.whiteColor,
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [
          //Image section ________________________________
          Container(
              height: AppSizes.ph125, // Image height
              width: AppSizes.pw230, // Image width
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.ph6),
                  image: const DecorationImage(
                    ///////////////    from Back-End     /////////////////////
                    image: AssetImage(AppAssets.offer1), // Example image
                    fit: BoxFit.cover,
                  ))),
          SizedBox(height: AppSizes.ph8),
          // Spacing between image and text
          Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.pw4, vertical: AppSizes.ph2),
              width: AppSizes.pw230,
              height: AppSizes.ph45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: AppSizes.pw175,
                        child: Text('تركيب كاميرات المراقبة',
                            maxLines: 2, // Set max number of lines to display
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: ColorManager.blackColor,
                                ))),
                    Row(crossAxisAlignment: CrossAxisAlignment.start, textBaseline: TextBaseline.alphabetic, children: [
                      Text('4.5', // Example text
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: ColorManager.blackColor,
                              )),
                      SizedBox(width: AppSizes.pw3),
                      Icon(Icons.star, color: ColorManager.yellowColor, size: AppSizes.ph16)
                    ])
                  ])),
          const Spacer(),
          Container(
              padding: EdgeInsets.symmetric(vertical: AppSizes.ph4, horizontal: AppSizes.pw8),
              ///// from Back-End ////////////////////////
              child: Text(
                '1000 ريال',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: AppSizes.ph15, color: ColorManager.darkRedColor),
              ))
        ]));
  }
}
