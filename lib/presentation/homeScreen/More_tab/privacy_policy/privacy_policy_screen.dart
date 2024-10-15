import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicy_Screen extends StatefulWidget {
  const PrivacyPolicy_Screen({super.key});

  @override
  State<PrivacyPolicy_Screen> createState() => _PrivacyPolicy_ScreenState();
}

class _PrivacyPolicy_ScreenState extends State<PrivacyPolicy_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Privacy Policy',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: ColorManager.whiteColor))),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorManager.lightBlueColor,
                  // Shadow color with opacity
                  spreadRadius: 2,
                  // Spread radius
                  blurRadius: 4,
                  // Blur radius
                  offset: Offset(0, 3), // Offset in the x and y directions
                )
              ],
              borderRadius: BorderRadius.circular(12),
              color: ColorManager.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''We at Bacura App are committed to protecting your privacy and ensuring the security of your personal information, This Privacy Policy explains how we collect, use and protect the information you provide to us when you use the App.''',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.darkBlueColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow:
                    TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ///// 1. Collection information /////////////////////////////////////////////////////////
              Text('1. Collection of Information:',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorManager.primaryBlueColor)),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''We collect personal information that you voluntarily provide in the App, such as name, email address, phone number, and other information that we may need to provide the service and to send service-related notifications, updates, or information about special offers and new features. We collect technical information about how you use the App, a record of your activity in the App, including the pages you visit, the features you use, and the time you spend using the App for the purpose of improving the user experience and quality of the Service and analyzing the use of the App, We keep your information only as long as necessary to achieve the purposes for which it was collected, or as required by law.''',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow:
                    TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////2. Protection of Information: /////////////////////////////////////////////////////
              Text(
                '2. Protection of Information:',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''We are committed to protecting your personal information. We take appropriate security measures to protect your personal information from unauthorized access, use, disclosure, alteration or destruction. This includes using encryption and cyber security technologies to maintain an updated security system.''',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow:
                    TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////3. Sharing Information: /////////////////////////////////////////////////////////
              Text(
                '3. Sharing Information:',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''We may share your personal information with a third party but only to the extent necessary to achieve the purposes specified in this policy, such as:
- Service providers and providers: companies with which we contract to provide certain services on our behalf.
- Partners: companies with which we cooperate to provide joint offers.
- Government agencies: if required by law.''',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow:
                    TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),

              ///4. Changes to the Privacy Policy: ./////////////////////////////////////////////
              Text(
                '4. Changes to the Privacy Policy:',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''We reserve the right to modify this policy at any time. We will notify you of any material changes through the application or by email.''',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow:
                    TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////5. User Rights: /////////////////////////////////////////////////////

              Text(
                '5. User Rights:',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''You can access and correct your personal information through the account settings in the application or by contacting us directly.
You can unsubscribe from marketing messages or delete your account at any time through the account settings or by contacting customer service.''',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow:
                    TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////6. Contact Us /////////////////////////////////////////////////////

              Text(
                '6. Contact Us',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''If you have any questions about this policy, please contact us at ( Bacura@gmail.com ) or (050428282).''',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow:
                    TextOverflow.visible, // Ensure text doesn't get clipped
              ),
            ],
          ),
        ),
      ),
    );
  }
}
