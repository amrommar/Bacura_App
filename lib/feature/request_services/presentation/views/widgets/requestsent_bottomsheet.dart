import 'package:bacura_app/core/utils/index.dart';

class RequestSent_BottomSheet extends StatefulWidget {
  @override
  State<RequestSent_BottomSheet> createState() => _RequestSent_BottomSheetState();
}

class _RequestSent_BottomSheetState extends State<RequestSent_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManager.whiteColor, borderRadius: BorderRadius.circular(AppSize.s20)),
      padding: const EdgeInsets.all(AppPadding.p16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// from Back End ///////////////////////
            Image.asset(
              'assets/images/request.png',
              height: 150,
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                /// from BAckEnd /////////////////
                'لقد أرسلنا الطلب، وسيقوم مزود الخدمة بالتواصل معك.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.greyColor,
                    ),
              ),
            ),

            ///////////////    Ok  Button     ///////////////////
            SmallElevatedButton(
                text: AppLocalizations.of(context)!.ok,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.homeScreenRoute);
                }),
          ],
        ),
      ),
    );
  }
}
