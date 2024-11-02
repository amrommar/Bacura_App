import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
          title: Text(AppLocalizations.of(context)!.terms_and_conditions,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.whiteColor))),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              // Shadow color with opacity
              spreadRadius: 2,
              // Spread radius
              blurRadius: 4,
              // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            )
          ], borderRadius: BorderRadius.circular(12), color: ColorManager.whiteColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''مرحبًا بك في تطبيق Bakora.
توفر هذه الشروط والأحكام الأساس القانوني لاستخدامك للتطبيق والخدمات المرتبطة به.

قبول الشروط: باستخدام التطبيق، فإنك توافق على الالتزام بهذه الشروط. إذا كنت لا توافق على أي من هذه الشروط، يرجى عدم استخدام التطبيق''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ///// 1. Definitions /////////////////////////////////////////////////////////
              Text('1. التعاريف: ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor)),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''- التطبيق: يشير إلى تطبيق Bacura وجميع خدماته والمحتوى المرتبط به.
- الخدمات: تعني جميع الخدمات والميزات التي يوفرها التطبيق.
- المستخدم: أي شخص يستخدم التطبيق أو أي من خدماته.
- مزود الخدمة: أي طرف يقدم الخدمات الفعلية للمستخدمين النهائيين أو العملاء
- مزود الخدمة: أي طرف يوفر البنية التحتية أو التقنيات أو الأنظمة التي يعتمد عليها التطبيق''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////2. Terms of Use /////////////////////////////////////////////////////
              Text(
                '2. شروط الاستخدام:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''- الأهلية: يجب أن يكون المستخدمون في سن قانونية لإبرام عقد ملزم أو الحصول على موافقة والديهم أو الوصي القانوني لاستخدام التطبيق.
- الاستخدام المقبول: يجب على المستخدمين استخدام التطبيق فقط للأغراض التي تم تصميم التطبيق من أجلها وبطريقة لا تنتهك حقوق الآخرين أو تؤثر سلبًا على تشغيل التطبيق. ويشمل ذلك عدم استخدام التطبيق للاحتيال أو المضايقة أو أي استخدام غير قانوني.
- إنشاء الحساب: يجب عليك إنشاء حساب لتتمكن من استخدام خدمات التطبيق.
- إرفاق المستندات: قد يتطلب استخدام بعض خدمات التطبيق إرفاق المستندات. يجب على المستخدمين تقديم معلومات صحيحة ودقيقة وحديثة عند إرسال هذه المستندات، والتأكد من أن جميع البيانات والمعلومات المقدمة تتوافق مع المتطلبات المحددة للخدمة.
- الاستخدام المستمر: بمجرد نشر التعديلات على الشروط، فإن استخدامك للتطبيق بعد هذا التحديث يعتبر قبولاً للشروط المعدلة.
- إنهاء الاستخدام: نحتفظ بالحق في إنهاء أو تعليق وصولك إلى التطبيق في أي وقت، دون إشعار مسبق، إذا انتهكت هذه الشروط.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////3. Intellectual Property Rights /////////////////////////////////////////////////////////
              Text(
                '3. حقوق الملكية الفكرية:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''جميع حقوق الطبع والنشر والعلامات التجارية وغيرها من الحقوق المتعلقة بالتطبيق ومحتوياته مملوكة لنا. لا يجوز نسخ أي جزء من التطبيق أو توزيعه أو تعديله دون إذن صريح منا.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),

              ///4. Limitation of Liability ./////////////////////////////////////////////
              Text(
                '4. حدود المسؤولية:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''تخلي الشركة مسؤوليتها ولا تضمن أن يكون التطبيق خاليًا من الأخطاء أو العيوب أو أن الخدمات ستكون متاحة في جميع الأوقات.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////5. User Rights: /////////////////////////////////////////////////////

              Text(
                '5. التغييرات:',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor),
              ),
              Divider(color: ColorManager.lightBlueColor, thickness: 2),
              Text(
                '''- تعديل الشروط: للشركة الحق في تعديل هذه الشروط في أي وقت.
- إلغاء الخدمة: للشركة الحق في إلغاء الخدمة أو أي جزء منها في أي وقت.''',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.blackColor),
                maxLines: null, // Allows unlimited lines
                textAlign: TextAlign.justify,
                overflow: TextOverflow.visible, // Ensure text doesn't get clipped
              ),
              Divider(color: ColorManager.whiteColor),
              ////6. Contact Us /////////////////////////////////////////////////////

              Text(
                '6. اتصل بنا:',
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
