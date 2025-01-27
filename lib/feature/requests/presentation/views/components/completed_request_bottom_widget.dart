import 'package:bacura_app/core/utils/index.dart';

class CompletedRequestBottomWidget extends StatelessWidget {
  const CompletedRequestBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              maximumSize: Size(AppSizes.pw170, AppSizes.ph50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                AppSizes.br30,
              ))),
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.re_request,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.bold,
                  ))),
      SizedBox(height: AppSizes.ph20),
      InkWell(
          ///////////////////////////        to go to the receipt file        /////////////////////////////////////
          onTap: () async {
            final Uri url = Uri.parse('https://printo.in/designs/t/bill-receipt-a5-billbook');
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: Text(AppLocalizations.of(context)!.invoice,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.w500,
                  )))
    ]);
  }
}
