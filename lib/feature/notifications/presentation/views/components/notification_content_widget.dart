import 'package:bacura_app/core/utils/index.dart';

class NotificationContentWidget extends StatelessWidget {
  String? title;
  String? description;

  NotificationContentWidget({super.key, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppSizes.pw320,
        padding: EdgeInsets.symmetric(vertical: AppSizes.ph8, horizontal: AppSizes.pw4),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///////////////    from Back-End     /////////////////////
              Text(title ?? 'طلبك جاهز الآن',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkBlueColor)),
              Text(
                  description ??
                      '''تم تجهيز طلبك بنجاح! بإمكانك الاطلاع على تفاصيله في شاشة الطلبات داخل التطبيق.
شكرًا لتسوقك معنا، ونتطلع لخدمتك مرة أخرى!

إذا تحتاج أي استفسارات، لا تتردد في التواصل معنا.''',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor))
            ]));
  }
}
