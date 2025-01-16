import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/routes_manager.dart';
import 'package:bacura_app/feature/more/technical_support/views/widgets/FQA_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FrequentlyAskedQuestionsView extends StatefulWidget {
  const FrequentlyAskedQuestionsView({super.key});

  @override
  State<FrequentlyAskedQuestionsView> createState() => _FrequentlyAskedQuestionsViewState();
}

class _FrequentlyAskedQuestionsViewState extends State<FrequentlyAskedQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.frequently_asked_questions,
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FQAContainer(
              question: 'كيف يمكنني طلب خدمة عبر التطبيق؟',
              answer:
                  'يمكنك طلب الخدمة بسهولة عبر اختيار نوع الخدمة من قائمة الخدمات، ثم تحديد نوع الطلب (توريد، صيانة، تركيب وبرمجة) وإدخال تفاصيل الطلب وإرساله.',
            ),
            FQAContainer(
              question: 'كيف أتابع حالة طلبي؟',
              answer: 'يمكنك متابعة حالة الطلب من خلال شاشة الطلبات، كما ستصلك إشعارات فورية بكل تحديث يطرأ على طلبك.',
            ),
            FQAContainer(
                question: 'ما هي طرق الدفع المتاحة؟',
                answer: 'يمكنك الدفع عبر التطبيق باستخدام البطاقة البنكية أو التحويل البنكي بعد استلامك عرض السعر.'),
            FQAContainer(
                question: 'هل يمكنني إلغاء الطلب بعد إرساله؟',
                answer: 'نعم، يمكنك إلغاء الطلب في أي وقت قبل إتمام عملية الدفع.'),
            FQAContainer(question: ' كيف أتواصل مع الدعم الفني؟', answer: '''يمكنك التواصل مع فريق الدعم الفني عبر:
إرسال شكوى من خلال قسم الشكاوى.
المحادثة المباشرة داخل التطبيق.
الاتصال عبر رقم خدمة العملاء'''),
            FQAContainer(
                question: 'كيف أستفيد من العروض والخدمات المميزة؟',
                answer: 'تظهر العروض والخدمات المميزة في الصفحة الرئيسية أو عبر صفحة العروض داخل التطبيق.'),
            InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.customerServiceRoute),
              child: Container(
                margin: const EdgeInsets.only(top: 16, right: 50, left: 50),
                decoration: BoxDecoration(
                  color: ColorManager.soLightGreyColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لم تجد إجابتك؟ تواصل معنا',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ColorManager.primaryBlueColor,
                          ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.headset_mic_outlined,
                      color: ColorManager.primaryBlueColor,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
