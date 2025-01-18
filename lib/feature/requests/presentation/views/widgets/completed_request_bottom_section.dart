import 'package:bacura_app/core/utils/index.dart';

class CompletedRequestBottomSection extends StatelessWidget {
  const CompletedRequestBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              maximumSize: const Size(170, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                AppSize.s30,
              ))),
          onPressed: () {},
          child: Text(AppLocalizations.of(context)!.re_request,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.whiteColor,
                    fontWeight: FontWeight.bold,
                  ))),
      SizedBox(height: 20.h),
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
