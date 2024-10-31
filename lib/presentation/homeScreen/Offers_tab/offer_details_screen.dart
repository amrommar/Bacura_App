import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'offer_card.dart';

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
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.offer_details)),
        body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 10.h),
          ////    From Back-End     ///////////////////////////////////////////////////////
          ///offer Image Section ///////////////////////////////////////////////////////
          Image.asset('assets/images/camera_offer.png'),

          /// offer Title Section ///////////////////////////////////////////////////////
          Container(
              margin: EdgeInsets.only(top: AppMargin.m8, right: AppMargin.m8, left: AppMargin.m8),
              child: Text('4 كاميرات IP ذكية خارجية (6 ميجابكسل)',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.blackColor, fontWeight: FontWeight.bold))),

          ///Details about offer Section ///////////////////////////////////////////////////////
          Container(
              margin: EdgeInsets.only(top: 4.h, right: 6.w, left: 6.w),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              decoration:
                  BoxDecoration(color: ColorManager.midWhiteColor, borderRadius: BorderRadius.circular(AppSize.s4)),
              child: ReadMoreText(
                text:
                    '''احصل على باقة 4 كاميرات IP خارجية بدقة 8MP مع الملحقات بسعر تنافسي وشحن مجاني وخصم على رسوم التركيب. يمكنك الدفع بالتقسيط أو الدفع عند الاستلام. يوجد ضمان لمدة عامين على المنتجات وسنة على تركيب كاميرات المراقبة. يمكنك طلب واحدة مخصصة لاحتياجاتك. تواصل معنا الآن واستفد من عروض كاميرات المراقبة بأسعار الجملة. سوف تحصل على: حزمة كاملة تتكون من:
4 كاميرات IP خارجية بدقة 8 ميجابكسل 4K (الموديل: DS-2CD2T83G2-2I)
جهاز تسجيل NVR مزود بـ (8 قنوات) (موديل: DS-7608NI-K2/8P)
قرص صلب للتخزين سعة 2 تيرابايت من نوع WD
80 مترا من كابل الشبكة CAT6 - 3M

المواصفات والمميزات:
الدقة: 8 ميجابكسل
نطاق الرؤية: يصل إلى 60 مترًا
فتحة العدسة: مقاس العدسة الثابتة 2.8 ملم
إمكانية الاتصال بالموبايل عن طريق جهاز التسجيل''',
              )),
          SizedBox(height: 10.h),
          // More Ask Section______________________________________________________
          Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text('مقترحة لك',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.blackColor, fontWeight: FontWeight.bold))),
          Divider(color: ColorManager.lightBlueColor),
          // More Ask list ______________________________________________________
          Container(
              height: 224.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        child: OffersCard() // Custom widget to show image and text
                        );
                  })),
          SizedBox(height: 50.h),

          /// Add To Cart Elevated Button//////////////////////////////////////////
          Center(
              child: SmallElevatedbutton(
                  text: AppLocalizations.of(context)!.pay,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.paymentScreenRoute);
                  }))
        ])));
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

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
          text: TextSpan(
              text: displayText,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black, fontSize: 14, height: 1.15),
              children: [
            if (!isExpanded && widget.text.length > truncateLength)
              TextSpan(
                  text: AppLocalizations.of(context)!.read_more,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.primaryBlueColor, fontSize: 14, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = true;
                      });
                    }),
            if (isExpanded)
              TextSpan(
                  text: AppLocalizations.of(context)!.read_less,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorManager.primaryBlueColor, fontSize: 14, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = false;
                      });
                    })
          ]))
    ]);
  }
}
