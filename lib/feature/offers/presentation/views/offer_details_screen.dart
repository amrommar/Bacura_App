import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/offers/presentation/controller/offers_details_provider.dart';

class OfferDetailsScreen extends StatelessWidget {
  final int id;
  final int index;

  const OfferDetailsScreen({super.key, required this.id, required this.index});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OffersDetailsProvider(id: id),
      child: Consumer<OffersDetailsProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: ColorManager.whiteColor,
            appBar: AppBar(
              title: Text(
                tr(AppStrings.offerDetails),
              ),
            ),
            body: (provider.isLoadingOffers)
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppSizes.br8),
                            child: Image.network(
                              provider.offersEntity.offersDataEntity[index].image!,
                            ),
                          ),
                        ),

                        Center(
                          child: Text(provider.offersEntity.offersDataEntity[index].name!,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorManager.blackColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                        ),
                        //!description
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: AppSizes.ph8,
                            horizontal: AppSizes.pw8,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.ph16,
                            horizontal: AppSizes.pw16,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorManager.midWhiteColor,
                            borderRadius: BorderRadius.circular(AppSizes.br8),
                          ),
                          child: Text(provider.offersEntity.offersDataEntity[index].description!,
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                    color: ColorManager.blackColor,
                                  )),
                        ),
                        SizedBox(height: AppSizes.ph60),

                        /// Add To Cart Elevated Button
                        provider.showOrderButton
                            ? Center(
                                child: CustomSmallElevatedButton(
                                  text: tr(AppStrings.offerRequest),
                                  onPressed: () {
                                    provider.orderOffer(
                                      id: provider.offersEntity.offersDataEntity[index].id!,
                                      context: context,
                                    );
                                  },
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
//
// class ReadMoreText extends StatefulWidget {
//   final String text;
//
//   const ReadMoreText({super.key, required this.text});
//
//   @override
//   _ReadMoreTextState createState() => _ReadMoreTextState();
// }
//
// class _ReadMoreTextState extends State<ReadMoreText> {
//   bool isExpanded = false;
//   final int truncateLength = 390; // Set your truncate limit
//
//   @override
//   Widget build(BuildContext context) {
//     String displayText = isExpanded
//         ? widget.text
//         : widget.text.length > truncateLength
//             ? '${widget.text.substring(0, truncateLength)}... '
//             : widget.text;
//
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       RichText(
//           text: TextSpan(
//               text: displayText,
//               style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                     color: Colors.black,
//                     fontSize: AppSizes.sp14,
//                     height: 1.15,
//                   ),
//               children: [
//             if (!isExpanded && widget.text.length > truncateLength)
//               TextSpan(
//                   text: AppLocalizations.of(context)!.read_more,
//                   style: Theme.of(context).textTheme.displayMedium!.copyWith(
//                         color: ColorManager.primaryBlueColor,
//                         fontSize: AppSizes.sp14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       setState(() {
//                         isExpanded = true;
//                       });
//                     }),
//             if (isExpanded)
//               TextSpan(
//                   text: AppLocalizations.of(context)!.read_less,
//                   style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                         color: ColorManager.primaryBlueColor,
//                         fontSize: AppSizes.sp14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       setState(() {
//                         isExpanded = false;
//                       });
//                     })
//           ]))
//     ]);
//   }
// }
