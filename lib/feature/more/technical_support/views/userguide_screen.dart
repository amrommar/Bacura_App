import 'package:bacura_app/core/utils/index.dart';
import 'package:bacura_app/feature/more/index.dart';

class UserGuideScreen extends StatefulWidget {
  const UserGuideScreen({super.key});

  @override
  State<UserGuideScreen> createState() => _UserGuideScreenState();
}

class _UserGuideScreenState extends State<UserGuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.user_guide),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BacuraLogoWidget(),
                SizedBox(height: 10.h),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorManager.lightWhiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      UserGuideTitle(title: 'مرحبًا بك في تطبيق باكورة التقنيات!'),
                      SizedBox(height: 10.h),
                      UserGuideContent(
                        content:
                            '''يسرّنا انضمامك إلى تطبيق باكورة التقنيات، الحل المتكامل لتلبية جميع احتياجاتك من الخدمات التقنية والذكية والأمنية. من خلال تطبيقنا، يمكنك بسهولة طلب خدمات تركيب كاميرات المراقبة، الأنظمة الذكية، وأنظمة التحكم في الدخول، مع ضمان تنفيذ احترافي وجودة عالية.
                    نهدف إلى تقديم تجربة سلسة وآمنة عبر خطوات بسيطة لطلب الخدمة ومتابعتها حتى التنفيذ، بدعم فني متواصل وفريق عمل محترف جاهز لخدمتك في أي وقت.''',
                      ),
                    ],
                  ),
                ),
                Divider(color: ColorManager.lightBlueColor, thickness: 2),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        UserGuideTitle(title: 'ابدأ رحلتك معنا بسهولة'),
                        SizedBox(height: 10.h),
                        UserGuideContent(
                          content:
                              '''لتسجيل الدخول إلى تطبيق باكورة التقنيات والاستفادة من خدماتنا المتنوعة، كل ما عليك فعله هو إدخال رقم جوالك، وستصلك رسالة نصية تحتوي على رمز تحقق. قم بإدخال الرمز في الحقل المخصص ليتم تسجيل دخولك مباشرة وبكل سهولة.
                  
                  أما إذا كنت مستخدمًا جديدًا، يمكنك إنشاء حساب بسرعة من خلال إدخال اسمك الكامل، رقم جوالك، بريدك الإلكتروني، واختيار مدينتك من القائمة المتاحة. بعد إدخال هذه البيانات، سيصلك رمز تحقق عبر رسالة نصية، قم بإدخاله لتفعيل حسابك والبدء في طلب خدماتنا بكل يسر واحترافية.''',
                        ),
                      ],
                    )),
                Divider(color: ColorManager.lightBlueColor, thickness: 2),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Center(child: UserGuideTitle(title: 'طريقة طلب الخدمة بسهولة')),
                        SizedBox(height: 10.h),
                        UserGuideContent(
                            content:
                                '''للحصول على خدمات باكورة التقنيات بكل سهولة واحترافية، يمكنك اتباع الخطوات التالية:'''),
                        UserGuideSmallTitle(title: '1. اختيار الخدمة'),
                        UserGuideContent(
                            content:
                                '''ابدأ باختيار الخدمة المناسبة من قائمة الخدمات المتوفرة في التطبيق والتي تشمل:'''),
                        UserGuideSmallList(content: '''
                  - كاميرات المراقبة
                  - الأنظمة الذكية
                  - أنظمة التحكم في الوصول
                  - الأنظمة الصوتية
                  - أنظمة حفظ الطاقة
                  - شبكات النت والاتصالات
                  '''),
                        UserGuideSmallTitle(title: '2. تحديد نوع الخدمة'),
                        UserGuideContent(
                            content: '''بعد اختيار الخدمة، حدد نوع الخدمة التي تحتاجها من بين الخيارات التالية:'''),
                        UserGuideSmallList(content: '''
                  - تركيب وبرمجة
                  - صيانة
                  - توريد
                  '''),
                        UserGuideSmallTitle(title: '3. إدخال تفاصيل الطلب'),
                        UserGuideContent(content: '''قم بتعبئة نموذج الطلب بالمعلومات التالية:'''),
                        UserGuideSmallList(content: '''
                  - التاريخ المناسب للتواصل
                  - الوقت المناسب للتواصل
                  - موقعك الجغرافي
                  - وصف دقيق للخدمة المطلوبة
                  '''),
                        UserGuideSmallTitle(title: '4. إرسال الطلب'),
                        UserGuideContent(
                            content:
                                '''بعد إدخال جميع التفاصيل، قم بإرسال الطلب. سيقوم فريق خدمة العملاء بالتواصل معك لتأكيد تفاصيل الطلب وإرسال عرض السعر عبر التطبيق.'''),
                        UserGuideSmallTitle(title: '5. مراجعة عرض السعر والدفع'),
                        UserGuideContent(
                            content:
                                '''بمجرد استلامك لعرض السعر، يمكنك مراجعته والموافقة عليه، ثم الانتقال إلى صفحة الدفع لإتمام عملية الدفع بكل أمان.'''),
                        UserGuideSmallTitle(title: '6. تنفيذ الخدمة'),
                        UserGuideContent(
                          content:
                              '''بعد إتمام الدفع، سيتم تحديد موعد مناسب لزيارة فريق العمل الفني إلى موقعك لتنفيذ الخدمة بجودة عالية. عند الانتهاء، يتم إغلاق الطلب رسميًا عبر التطبيق.''',
                        ),
                        UserGuideSmallTitle(
                          title: '''
                    
                    - راقب حالة طلباتك عبر شاشة الطلبات، وتواصل مع فريق خدمة العملاء بسهولة من خلال شاشة الدعم.
                    ''',
                        ),
                        UserGuideSmallTitle(
                          title: '''- انغمس في تجربة استثنائية مع خدمات السينما المنزلية المصممة لرفاهيتك.
                    ''',
                        ),
                        UserGuideSmallTitle(
                          title: '''- استفد من الاستشارات التقنية المتخصصة التي تلبي جميع احتياجاتك التقنية.
                    ''',
                        ),
                        UserGuideSmallTitle(
                            title: '''- تابع أحدث العروض والخصومات عبر الإعلانات في الصفحة الرئيسية أو صفحة العروض.
                    '''),
                        UserGuideContent(content: '''باكورة التقنيات تجعل طلب خدماتك التقنية أسهل وأكثر راحة!'''),
                      ],
                    )),
                Divider(color: ColorManager.lightBlueColor, thickness: 2),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        UserGuideTitle(title: 'متابعة حالة الطلب بسهولة'),
                        SizedBox(height: 10.h),
                        UserGuideContent(
                            content:
                                '''      يمكنك متابعة حالة طلبك بكل سهولة من خلال شاشة الطلبات داخل التطبيق، حيث يتم تحديث حالة الطلب بشكل مستمر لتبقى على اطلاع بكل جديد. كما تصلك إشعارات فورية حول أي تحديثات تتعلق بطلبك عبر قسم الإشعارات لضمان تجربة سلسة واحترافية.
                  
                  ابقَ دائمًا على تواصل مع فريقنا وتابع خطوات تنفيذ طلبك بكل مرونة وشفافية!'''),
                      ],
                    )),
                Divider(color: ColorManager.lightBlueColor, thickness: 2),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Center(child: UserGuideTitle(title: 'التواصل مع الدعم الفني')),
                        SizedBox(height: 10.h),
                        UserGuideContent(content: '''
                  لضمان حصولك على أفضل تجربة ودعم متكامل، يوفر تطبيق باكورة التقنيات عدة طرق للتواصل مع فريق الدعم الفني بكل سهولة ومرونة:'''),
                        UserGuideSmallList(content: '- تقديم الشكاوى:'),
                        UserGuideContent(
                            content:
                                '''يمكنك إرسال شكوى مباشرة عبر قسم الشكاوى لتوضيح مشكلتك وسيتم متابعتها بشكل سريع.'''),
                        UserGuideSmallList(content: '- المحادثة الفورية:'),
                        UserGuideContent(content: '''
                  تواصل مباشرة مع فريق خدمة العملاء من خلال المحادثة الفورية داخل التطبيق للحصول على استجابة سريعة واستفسارات فورية.'''),
                        UserGuideSmallList(content: '- الاتصال الهاتفي:'),
                        UserGuideContent(content: '''
                   يمكنك أيضًا التواصل عبر رقم خدمة العملاء المتوفر داخل التطبيق للحصول على دعم مباشر.
                  
                  نحن دائمًا هنا لخدمتك وتقديم الحلول التي تناسب احتياجاتك بكل احترافية.'''),
                      ],
                    )),
                Divider(color: ColorManager.lightBlueColor, thickness: 2),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorManager.lightWhiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        UserGuideTitle(title: 'إدارة حسابك الشخصي'),
                        SizedBox(height: 10.h),
                        UserGuideContent(content: '''
                              تحكّم بحسابك بسهولة من خلال شاشة الصفحة الشخصية في تطبيق باكورة التقنيات، حيث يمكنك:
                              تعديل بياناتك الشخصية بسرعة عبر الضغط على المعلومات التي ترغب بتحديثها ثم حفظ التغييرات.'''),
                      ],
                    )),
                SizedBox(height: 10.h),
              ],
            ),
          )),
    );
  }
}
