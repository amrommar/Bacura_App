import 'package:bacura_app/core/utils/index.dart';

class LastOperations_Screen extends StatefulWidget {
  @override
  State<LastOperations_Screen> createState() => _LastOperations_ScreenState();
}

class _LastOperations_ScreenState extends State<LastOperations_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.lastOperations)),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.invoiceDetailsRoute);
                        },
                        child: const PaymentOperationContainer());
                  }))
        ]));
  }
}

// // ///////// ALL  -  Payments  -  Deposits   Filtering   ///////////////
// // Container(
// //     padding: EdgeInsets.only(top: 8),
// //     height: 40.h,
// //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
// //       Container(
// //           width: 120.w,
// //           alignment: Alignment.center,
// //           child: Text(
// //             AppLocalizations.of(context)!.all,
// //             style: Theme.of(context)
// //                 .textTheme
// //                 .titleMedium!
// //                 .copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.bold),
// //           )),
// //       VerticalDivider(color: ColorManager.lightBlueColor, thickness: 2),
// //       Container(
// //           width: 120.w,
// //           alignment: Alignment.center,
// //           child: Text(
// //             AppLocalizations.of(context)!.payment,
// //             style: Theme.of(context)
// //                 .textTheme
// //                 .titleMedium!
// //                 .copyWith(color: ColorManager.greyColor, fontWeight: FontWeight.bold),
// //           )),
// //       VerticalDivider(color: ColorManager.lightBlueColor, thickness: 2),
// //       Container(
// //           width: 120.w,
// //           alignment: Alignment.center,
// //           child: Text(AppLocalizations.of(context)!.deposit,
// //               style: Theme.of(context)
// //                   .textTheme
// //                   .titleMedium!
// //                   .copyWith(color: ColorManager.greyColor, fontWeight: FontWeight.bold)))
// //     ])),
// Divider(color: ColorManager.lightBlueColor, thickness: 2),
