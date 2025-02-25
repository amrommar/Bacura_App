import 'package:bacura_app/core/utils/index.dart';

class OrderSentBottomSheet extends StatefulWidget {
  final String title;
  final String image;
  const OrderSentBottomSheet({super.key, required this.title, required this.image});

  @override
  State<OrderSentBottomSheet> createState() => _OrderSentBottomSheetState();
}

class _OrderSentBottomSheetState extends State<OrderSentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.br20),
      ),
      padding: EdgeInsets.all(AppSizes.ph16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// from Back End ///////////////////////
            Image.asset(
              imagePath,
              height: AppSizes.ph150,
              width: AppSizes.pw150,
            ),
            Padding(
              padding: EdgeInsets.all(AppSizes.ph16),
              child: Text(
                /// from BAckEnd /////////////////
                widget.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.greyColor,
                    ),
              ),
            ),

            ///////////////    Ok  Button     ///////////////////
            CustomSmallElevatedButton(
                text: AppLocalizations.of(context)!.ok,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
