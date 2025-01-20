// import 'package:bacura_app/core/utils/index.dart';
// import 'package:bacura_app/feature/auth/presentation/controller/verify_provider.dart';
//
// class VerifyScreen extends StatefulWidget {
//   const VerifyScreen({super.key});
//
//   @override
//   State<VerifyScreen> createState() => _VerifyScreenState();
// }
//
// class _VerifyScreenState extends State<VerifyScreen> {
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Image.asset(ImageAssets.background2Image),
//       Scaffold(
//           appBar: AppBar(
//               iconTheme: IconThemeData(color: ColorManager.primaryBlueColor, size: 30),
//               backgroundColor: ColorManager.transparent,
//               elevation: 0,
//               toolbarHeight: 100.h),
//           backgroundColor: ColorManager.transparent,
//           resizeToAvoidBottomInset: false,
//           body: ChangeNotifierProvider(
//             create: (context) => VerifyProvider(),
//             child: Consumer<VerifyProvider>(
//               builder: (context, provider, child) => Container(
//                   padding: EdgeInsets.symmetric(horizontal: 29.w),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     const BacuraLogoWidget(),
//                     SizedBox(height: 50.h),
//                     Text(
//                       AppLocalizations.of(context)!.oTPNumber,
//                       style: Theme.of(context).textTheme.displayLarge,
//                     ),
//                     Divider(color: ColorManager.lightBlueColor),
//                     SizedBox(height: 10.h),
//                     Text(AppLocalizations.of(context)!.oTPNumberSent,
//                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                               color: ColorManager.greyColor,
//                             )),
//                     const ChangeNumberWidget(),
//                     SizedBox(height: 30.h),
//                     Expanded(
//                       child: Form(
//                         key: formKey,
//                         child: CustomPinCodeTextField(
//                           onChanged: (value) {
//                             provider.pinCode = value;
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 50.h),
//                     Center(
//                         child: Column(children: [
//                       VerifyButtonWidget(
//                         onPressed: () {
//                           provider.validatePin(context);
//                         },
//                       ),
//                       SizedBox(height: 20.h),
//                       const ResendOtpAgainWidget()
//                     ]))
//                   ])),
//             ),
//           ))
//     ]);
//   }
//
// // Validation function for the PIN
// }
