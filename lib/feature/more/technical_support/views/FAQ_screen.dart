import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        tr(AppStrings.FAQ),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FQAContainer(
              question: tr(AppStrings.howCanIRequestService),
              answer: tr(AppStrings.howCanIRequestServiceAnswer),
            ),
            FQAContainer(
              question: tr(AppStrings.howCanITrackMyOrder),
              answer: tr(AppStrings.howCanITrackMyOrderAnswer),
            ),
            FQAContainer(
              question: tr(AppStrings.howCanIPay),
              answer: tr(AppStrings.howCanIPayAnswer),
            ),
            FQAContainer(
              question: tr(AppStrings.canICancelOrder),
              answer: tr(AppStrings.canICancelOrderAnswer),
            ),
            FQAContainer(
              question: tr(AppStrings.howCanIContactSupport),
              answer: tr(AppStrings.howCanIContactSupportAnswer),
            ),
            FQAContainer(
              question: tr(AppStrings.howCanIUseSpecialOffers),
              answer: tr(AppStrings.howCanIUseSpecialOffersAnswer),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                Routes.customerServiceRoute,
              ),
              child: Container(
                margin: EdgeInsets.only(
                  top: AppSizes.ph16,
                  right: AppSizes.pw50,
                  left: AppSizes.pw50,
                ),
                decoration: BoxDecoration(
                  color: ColorManager.soLightGreyColor,
                  borderRadius: BorderRadius.circular(
                    AppSizes.br12,
                  ),
                ),
                padding: EdgeInsets.all(AppSizes.br12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tr(AppStrings.didnotFindYourAnswer),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          ),
                    ),
                    SizedBox(width: AppSizes.pw5),
                    Icon(
                      Icons.headset_mic_outlined,
                      color: ColorManager.primaryBlueColor,
                      size: AppSizes.ph25,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.ph20),
          ],
        ),
      ),
    );
  }
}
