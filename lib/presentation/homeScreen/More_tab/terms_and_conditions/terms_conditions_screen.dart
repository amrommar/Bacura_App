import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditions_Screen extends StatefulWidget {
  const TermsConditions_Screen({super.key});

  @override
  State<TermsConditions_Screen> createState() => _TermsConditions_ScreenState();
}

class _TermsConditions_ScreenState extends State<TermsConditions_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Terms and Conditions',
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
                '''Welcome to the Bakora application.
These terms and conditions provide the legal basis for your use of the application and its related services.
Acceptance of the terms: By using the application, you agree to abide by these terms. If you do not agree to any of these terms, please do not use the application''',
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
              ///// 1. Definitions /////////////////////////////////////////////////////////
              Text('1. Definitions',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorManager.primaryBlueColor)),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''- Application: refers to the Bacura application and all its services and related content.
- Services: means all services and features provided by the application.
- User: any person who uses the application or any of its services.
- Service Provider: any party that provides the actual services to end users or customers
- Service Provider: any party that provides the infrastructure, technologies or systems on which the application depends''',
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
              ////2. Terms of Use /////////////////////////////////////////////////////
              Text(
                '2. Terms of Use',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''- Eligibility: Users must be of legal age to enter into a binding contract or have the consent of their parents or legal guardian to use the application.
- Acceptable Use: Users must use the application only for the purposes for which the application was designed and in a manner that does not violate the rights of others or adversely affect the operation of the application. This includes not using the application for fraud, harassment, or any illegal use.
- Account Creation: You must create an account to be able to use the application services.
- Attaching documents: Using some of the application services may require attaching documents. Users must provide correct, accurate and up-to-date information when submitting these documents, and ensure that all data and information provided comply with the specific requirements of the service.
- Continued use: Once amendments to the terms are published, your use of the application after this update shall be deemed acceptance of the amended terms.
- Termination of use: We reserve the right to terminate or suspend your access to the application at any time, without prior notice, if you violate these terms.''',
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
              ////3. Intellectual Property Rights /////////////////////////////////////////////////////////
              Text(
                '3. Intellectual Property Rights',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''All copyrights, trademarks and other rights related to the application and its contents are owned by us. No part of the application may be copied,
distributed or modified without our express permission.''',
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

              ///4. Limitation of Liability ./////////////////////////////////////////////
              Text(
                '4. Limitation of Liability',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''The company disclaims any responsibility and does not guarantee that the application will be free from errors or defects or that the services will be available at all times.''',
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
                '5. Changes',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''- Modification of Terms: The company has the right to modify these terms at any time.
- Cancellation of the service: The company has the right to cancel the service or any part thereof at any time.''',
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
