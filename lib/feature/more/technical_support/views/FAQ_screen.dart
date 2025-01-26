import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
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
                margin: EdgeInsets.only(top: AppSizes.ph16, right: AppSizes.pw50, left: AppSizes.pw50),
                decoration: BoxDecoration(
                  color: ColorManager.soLightGreyColor,
                  borderRadius: BorderRadius.circular(AppSizes.br12),
                ),
                padding: EdgeInsets.all(AppSizes.br12),
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
                    SizedBox(width: AppSizes.pw5),
                    Icon(
                      Icons.headset_mic_outlined,
                      color: ColorManager.primaryBlueColor,
                      size: AppSizes.ph25,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSizes.ph20),
          ],
        ),
      ),
    );
  }
}
