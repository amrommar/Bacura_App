import 'package:bacura_app/core/utils/index.dart';

class PaymentBottomSheet extends StatelessWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.ph12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BacuraLogoWidget(),
          Text(
              '''لإتمام طلبك يرجي تحويل المبلغ الإجمالي للطلب عن طريقة حسابنا لدي البنك الأهلي السعودى بإسم شركة باكورة التقنيات:''',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                  )),
          SizedBox(height: AppSizes.ph10),
          Text('''(49400000475403)''',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryBlueColor,
                  )),
          Text('''(SA1710000049400000475403)''',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.primaryBlueColor,
                  )),
          SizedBox(height: AppSizes.ph10),
          Text(
              '''بعد إتمام عملية التحويل الرجاء إرسال إيصال التحويل الي رقم خدمة العملاء وهو (0547000015) لاجراء الخطوة التالية وتنفيذ طلبك بنجاح ''',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.darkBlueColor,
                  )),
        ],
      ),
    );
  }
}
