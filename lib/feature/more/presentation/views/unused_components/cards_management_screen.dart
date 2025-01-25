import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';
import 'package:bacura_app/feature/more/presentation/views/unused_components/edit_card_bottomsheet.dart';

class Cards_Management_Screen extends StatefulWidget {
  @override
  State<Cards_Management_Screen> createState() => _Cards_Management_ScreenState();
}

class _Cards_Management_ScreenState extends State<Cards_Management_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.cardsManagement)),
        floatingActionButton: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: FloatingActionButton(
                elevation: 5,
                shape: CircleBorder(),
                focusColor: ColorManager.lightBlueColor,
                backgroundColor: ColorManager.lightBlueColor,
                onPressed: () {
                  showAddCardBottomSheet();
                },
                child: Icon(Icons.add_card, color: ColorManager.primaryBlueColor, size: 30))),
        body: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.only(right: 20.w, top: 16.h, left: 20.w),
                  child: Stack(children: [
                    provider.appLanguage == 'en'
                        ? SvgPicture.asset('assets/images/card_img.svg')
                        : SvgPicture.asset('assets/images/cardimg2.svg'),
                    Container(
                        height: 245.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            InkWell(
                                child: Icon(Icons.edit, color: ColorManager.whiteColor),
                                onTap: () {
                                  showEditCardBottomSheet();
                                }),

                            /// Al Rajehy Logo ///////////////////////
                            Container(height: 40.h, child: Image.asset('assets/images/alrajhi_logo.png'))
                          ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Container(height: 40.h, child: Image.asset('assets/images/mada_logo.png'))]),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text('**** **** **** ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: ColorManager.whiteColor, letterSpacing: 4.0)),
                            //// from Back-End ////////////////
                            Text('2345',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: ColorManager.whiteColor, letterSpacing: 1.0))
                          ]),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(AppLocalizations.of(context)!.card_holder_name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: ColorManager.whiteColor, fontSize: 11)),
                              Text('Amr Omar',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.whiteColor))
                            ]),
                            Column(children: [
                              Text(AppLocalizations.of(context)!.expire_date,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: ColorManager.whiteColor, fontSize: 11)),
                              Text('15/04',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.whiteColor))
                            ])
                          ])
                        ]))
                  ]));
            }));
  }

  void showAddCardBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return AddCard_BottomSheet();
        });
  }

  void showEditCardBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return EditCardBottomSheet();
        });
  }
}
