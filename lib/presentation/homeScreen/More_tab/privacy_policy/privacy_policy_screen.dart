import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          title: Text(AppLocalizations.of(context)!.privacy_policy,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.whiteColor))),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            )
          ], borderRadius: BorderRadius.circular(12), color: ColorManager.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //// from Back-End /////////////////////////////////////////////////
              Text(
                  '''نحن في تطبيق Bacura ملتزمون بحماية خصوصيتك وضمان أمان معلوماتك الشخصية، تشرح سياسة الخصوصية هذه كيفية جمعنا واستخدامنا وحماية المعلومات التي تقدمها لنا عند استخدامك للتطبيق''',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
                  maxLines: null, // Allows unlimited lines
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.visible),
              Divider(color: ColorManager.whiteColor),
              ///// 1. Collection information /////////////////////////////////////////////////////////
              Text('1. جمع المعلومات:',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor)),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''نحن نجمع المعلومات الشخصية التي تقدمها طواعية في التطبيق، مثل الاسم وعنوان البريد الإلكتروني ورقم الهاتف والمعلومات الأخرى التي قد نحتاجها لتقديم الخدمة وإرسال إشعارات أو تحديثات أو معلومات متعلقة بالخدمة أو حول العروض الخاصة والميزات الجديدة. نحن نجمع معلومات فنية حول كيفية استخدامك للتطبيق، وسجل لنشاطك في التطبيق، بما في ذلك الصفحات التي تزورها والميزات التي تستخدمها والوقت الذي تقضيه في استخدام التطبيق لغرض تحسين تجربة المستخدم وجودة الخدمة وتحليل استخدام التطبيق، ونحتفظ بمعلوماتك فقط طالما كان ذلك ضروريًا لتحقيق الأغراض التي تم جمعها من أجلها، أو حسبما يقتضيه القانون.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////2. Protection of Information: /////////////////////////////////////////////////////
              Text(
                '2. حماية المعلومات:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''نحن ملتزمون بحماية معلوماتك الشخصية. ونتخذ التدابير الأمنية المناسبة لحماية معلوماتك الشخصية من الوصول غير المصرح به أو الاستخدام أو الكشف عنها أو تغييرها أو تدميرها. ويشمل ذلك استخدام تقنيات التشفير والأمن السيبراني للحفاظ على نظام أمان محدث.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////3. Sharing Information: /////////////////////////////////////////////////////////
              Text(
                '3. مشاركة المعلومات:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''قد نشارك معلوماتك الشخصية مع طرف ثالث ولكن فقط بالقدر الضروري لتحقيق الأغراض المحددة في هذه السياسة، مثل:
- مقدمو الخدمات والمزودون: الشركات التي نتعاقد معها لتقديم خدمات معينة نيابة عنا.
- الشركاء: الشركات التي نتعاون معها لتقديم عروض مشتركة.
- الهيئات الحكومية: إذا كان القانون يفرض ذلك.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),

              ///4. Changes to the Privacy Policy: ./////////////////////////////////////////////
              Text(
                '4. التغييرات على سياسة الخصوصية:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''نحتفظ بالحق في تعديل هذه السياسة في أي وقت. وسنقوم بإخطارك بأي تغييرات جوهرية من خلال التطبيق أو عبر البريد الإلكتروني.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////5. User Rights: /////////////////////////////////////////////////////

              Text(
                '5. حقوق المستخدم:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''يمكنك الوصول إلى معلوماتك الشخصية وتصحيحها من خلال إعدادات الحساب في التطبيق أو عن طريق الاتصال بنا مباشرة.
    يمكنك إلغاء الاشتراك في الرسائل التسويقية أو حذف حسابك في أي وقت من خلال إعدادات الحساب أو عن طريق الاتصال بخدمة العملاء.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////6. Contact Us /////////////////////////////////////////////////////

              Text(
                '6. اتصل بنا',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''إذا كانت لديك أي أسئلة حول هذه السياسة، يرجى الاتصال بنا على (Bacura@gmail.com) أو (050428282).''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
            ],
          ),
        ),
      ),
    );
  }
}
