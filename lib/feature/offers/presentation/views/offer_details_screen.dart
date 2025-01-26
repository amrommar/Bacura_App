import 'package:bacura_app/core/utils/index.dart';

class OfferDetailsScreen extends StatefulWidget {
  const OfferDetailsScreen({super.key});

  @override
  State<OfferDetailsScreen> createState() => _OfferDetailsScreenState();
}

class _OfferDetailsScreenState extends State<OfferDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.offer_details),
        ),
        body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: AppSizes.ph10),
          ////    From Back-End     ///////////////////////////////////////////////////////
          ///offer Image Section ///////////////////////////////////////////////////////
          Image.asset(AppAssets.cameraOffer),

          /// offer Title Section ///////////////////////////////////////////////////////
          Container(
              margin: EdgeInsets.only(
                top: AppSizes.ph8,
                right: AppSizes.pw8,
                left: AppSizes.pw8,
              ),
              child: Text('4 كاميرات IP ذكية خارجية (6 ميجابكسل)',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.blackColor, fontWeight: FontWeight.bold))),

          ///Details about offer Section ///////////////////////////////////////////////////////
          Container(
              margin: EdgeInsets.only(top: AppSizes.ph4, right: AppSizes.pw6, left: AppSizes.pw6),
              padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw12),
              decoration: BoxDecoration(
                  color: ColorManager.midWhiteColor,
                  borderRadius: BorderRadius.circular(
                    AppSizes.br4,
                  )),
              child: const ReadMoreText(
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
          SizedBox(height: AppSizes.ph10),
          SizedBox(height: AppSizes.ph50),

          /// Add To Cart Elevated Button//////////////////////////////////////////
          Center(child: CustomSmallElevatedButton(text: AppLocalizations.of(context)!.request, onPressed: () {}))
        ])));
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;

  const ReadMoreText({super.key, required this.text});

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
            ? '${widget.text.substring(0, truncateLength)}... '
            : widget.text;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
          text: TextSpan(
              text: displayText,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                    fontSize: AppSizes.sp14,
                    height: 1.15,
                  ),
              children: [
            if (!isExpanded && widget.text.length > truncateLength)
              TextSpan(
                  text: AppLocalizations.of(context)!.read_more,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.primaryBlueColor,
                        fontSize: AppSizes.sp14,
                        fontWeight: FontWeight.bold,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      setState(() {
                        isExpanded = true;
                      });
                    }),
            if (isExpanded)
              TextSpan(
                  text: AppLocalizations.of(context)!.read_less,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorManager.primaryBlueColor,
                        fontSize: AppSizes.sp14,
                        fontWeight: FontWeight.bold,
                      ),
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
