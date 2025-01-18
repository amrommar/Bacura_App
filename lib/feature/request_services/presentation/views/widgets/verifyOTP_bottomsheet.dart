import 'package:bacura_app/core/utils/index.dart';

class OTP_Bottomsheet extends StatefulWidget {
  @override
  State<OTP_Bottomsheet> createState() => _OTP_BottomsheetState();
}

class _OTP_BottomsheetState extends State<OTP_Bottomsheet> {
  bool isChecked = false;

  var formKey = GlobalKey<FormState>();
  String pinCode = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ///Title of bottom sheet ////////////
          Text(
            AppLocalizations.of(context)!.oTPNumber,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Divider(color: ColorManager.primaryBlueColor),
          // OTP text Fields ____________________________
          CustomPinCodeTextField(onChanged: (value) {
            setState(() {
              pinCode = value; // Store the entered PIN
            });
          }),
          SizedBox(height: 10.h),
          ////Counter and Resend OTP Text //////////////////////////////////////////////////
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(AppLocalizations.of(context)!.sendOTPNumberAgain,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorManager.greyColor,
                    )),
            SizedBox(width: 10.w),

            /// make it a counter to resend the code ////////////
            Text('60', style: Theme.of(context).textTheme.displayMedium)
          ]),
          SizedBox(height: 40.h),
          ////verify Elevated Button &  send OTP again//////////////////////////////////////////////////
          Center(
              child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  //// make a good design for this Dialog /////
                  CustomAlertDialog(
                    title: 'Successfully Login',
                    imagePath: 'assets/images/bad-feedback.png',
                    content: Text('تم تسجيل الدخول بنجاح'),
                    onCancel: () {},
                    onOk: () {},
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.verify,
                  style: Theme.of(context).textTheme.titleMedium,
                )),
            SizedBox(height: 20.h),
          ]))
        ])));
  }
}
