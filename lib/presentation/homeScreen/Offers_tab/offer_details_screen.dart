import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/offer_card.dart';

class OfferDetails_Screen extends StatefulWidget {
  const OfferDetails_Screen({super.key});

  @override
  State<OfferDetails_Screen> createState() => _OfferDetails_ScreenState();
}

class _OfferDetails_ScreenState extends State<OfferDetails_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      appBar: AppBar(title: Text('Offer Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),

            ///offer Image Section ///////////////////////////////////////////////////////
            Image.asset('assets/images/camera_offer.png'),

            /// offer Title Section ///////////////////////////////////////////////////////
            Container(
                margin: EdgeInsets.only(
                    top: AppMargin.m8, right: AppMargin.m8, left: AppMargin.m8),
                child: Text('4 outdoor smart IP cameras (6MP)',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.blackColor,
                        fontWeight: FontWeight.bold))),

            ///Details about offer Section ///////////////////////////////////////////////////////
            Container(
              margin: EdgeInsets.only(
                  top: AppMargin.m4, right: AppMargin.m6, left: AppMargin.m6),
              padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p8, horizontal: AppPadding.p12),
              decoration: BoxDecoration(
                  color: ColorManager.midWhiteColor,
                  borderRadius: BorderRadius.circular(AppSize.s4)),
              child: ReadMoreText(
                text:
                    '''Get a package of 4 outdoor IP cameras with 8MP resolution with accessories at a competitive price, free shipping and installation fee discount. You can pay in installments or pay upon receipt. There is a two-year warranty on the products and a year on installing the surveillance cameras. You can order a custom one for your needs. Contact us now and benefit from the surveillance camera offers at wholesale prices. You will get:A complete package consisting of:
4 outdoor IP cameras with 8MP 4K resolution (Model: DS-2CD2T83G2-2I)
NVR recording device with (8 channels) (Model: DS-7608NI-K2/8P)
2TB WD storage hard disk
80 meters of CAT6 - 3M network cable

Specifications and features:
Resolution: 8MP
Viewing range: up to 60 meters
Lens aperture: Fixed lens size 2.8 mm
Possibility of connecting to the mobile via the recording device''',
              ),
            ),
            SizedBox(height: 10.h),
            // More Ask Section______________________________________________________
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text('Suggested for you',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ColorManager.blackColor,
                      fontWeight: FontWeight.bold)),
            ),
            Divider(
              color: ColorManager.lightBlueColor,
            ),
            // More Ask list ______________________________________________________
            Container(
              height: 220.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // Set the direction to horizontal
                itemCount: 10,
                // Replace with the number of items you want to display
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: OffersCard(), // Custom widget to show image and text
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),

            /// Add To Cart Elevated Button//////////////////////////////////////////
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(220.w, 100.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s30))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add To Cart',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: ColorManager.whiteColor,
                                fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.add_shopping_cart_sharp,
                          color: ColorManager.whiteColor)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;

  ReadMoreText({required this.text});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;
  final int truncateLength = 390; // Set your truncate limit

  @override
  Widget build(BuildContext context) {
    String displayText = isExpanded
        ? widget.text
        : widget.text.length > truncateLength
            ? widget.text.substring(0, truncateLength) + '... '
            : widget.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: displayText,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.black, fontSize: 14, height: 1.15),
            children: [
              if (!isExpanded && widget.text.length > truncateLength)
                TextSpan(
                  text: 'Read More',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.primaryBlueColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = true;
                      });
                    },
                ),
              if (isExpanded)
                TextSpan(
                  text: ' Read Less',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ColorManager.primaryBlueColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
