import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/verifyOTP_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';

class Payment_Screen extends StatefulWidget {
  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {
  bool isChecked = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController mmyyController = TextEditingController();

  // Mask formatter for MM/YY format
  final maskFormatter =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    // Get the height of the keyboard to avoid overlapping
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(title: Text('Payment Screen')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          child: Column(
            children: [
              /// Payment Methods Containers ////////////////////////////////////////////////////////////////////
              Custom_Payment_Container(
                  widget: Text('Saved Cards',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorManager.darkBlueColor))),
              Custom_Payment_Container(
                  widget: Image.asset('assets/images/logos_mastercard.png')),
              Custom_Payment_Container(
                  widget: Image.asset('assets/images/Mada_Logo.svg 1.png')),
              Custom_Payment_Container(
                  widget: Text('Pay From Wallet',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorManager.darkBlueColor))),
              SizedBox(height: 250.h),

              /// Terms And Conditions container /////////////////////////////////////////////////////
              Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorManager.midWhiteColor,
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '''الشروط والأحكام
                                
مرحبًا بكم في Bacura
توفر هذه الشروط والأحكام الأساس القانوني لاستخدامك للتطبيق والخدمات المرتبطة به.

قبول الشروط: باستخدام التطبيق، فإنك توافق على الالتزام بهذه الشروط. إذا كنت لا توافق على أي من هذه الشروط، يرجى عدم
استخدام التطبيق

1. التعاريف
 التطبيق: يشير إلى [اسم التطبيق] وجميع خدماته والمحتوى المرتبط به.
 الخدمات: تعني جميع الخدمات والميزات التي يوفرها التطبيق.
 المستخدم: أي شخص يستخدم التطبيق أو أي من خدماته.
 مزود الخدمة: أي طرف يقدم الخدمات الفعلية للمستخدمين النهائيين أو العملاء
 مزود الخدمة: أي طرف يقدم البنية الأساسية أو التقنيات أو الأنظمة التي يعمل عليها التطبيق

2. شروط الاستخدام
 الأهلية
يجب أن يكون المستخدمون في سن قانونية لإبرام عقد ملزم أو الحصول على موافقة والديهم أو الوصي القانوني لاستخدام التطبيق.
 الاستخدام المقبول
يجب على المستخدمين استخدام التطبيق فقط للأغراض التي صُمم التطبيق من أجلها وبطريقة لا تنتهك حقوق الآخرين أو تؤثر سلبًا على تشغيل التطبيق. ويشمل ذلك عدم استخدام التطبيق للاحتيال أو المضايقة أو أي استخدام غير قانوني.

 إنشاء حساب
يجب عليك إنشاء حساب لاستخدام خدمات التطبيق.

 إرفاق المستندات
قد يتطلب استخدام بعض خدمات التطبيق إرفاق المستندات. يجب على المستخدمين تقديم معلومات صحيحة ودقيقة وحديثة عند إرسال هذه المستندات، والتأكد من أن جميع البيانات والمعلومات المقدمة تتوافق مع المتطلبات المحددة للخدمة.

 الاستخدام المستمر
بمجرد نشر التعديلات على الشروط، فإن استخدامك للتطبيق بعد هذا التحديث يعتبر قبولاً للشروط المعدلة.

 إنهاء الاستخدام
نحتفظ بالحق في إنهاء أو تعليق وصولك إلى التطبيق في أي وقت، دون إشعار مسبق، إذا انتهكت هذه الشروط.
3. حقوق الملكية الفكرية
جميع حقوق النشر والعلامات التجارية وغيرها من الحقوق في التطبيق ومحتوياته مملوكة لنا. لا يجوز نسخ أي جزء من التطبيق أو توزيعه أو تعديله دون إذن صريح منا.
4. الحد من المسؤولية
تنفي الشركة أي مسؤولية ولا تضمن خلو التطبيق من الأخطاء أو العيوب أو أن الخدمات ستكون متاحة دائمًا.
5. التغييرات
 تعديل الشروط: للشركة الحق في تعديل هذه الشروط في أي وقت.
 إلغاء الخدمة: للشركة الحق في إلغاء الخدمة أو أي جزء منها في أي وقت.
6. الاتصال بنا
إذا كانت لديك أي أسئلة حول هذه الشروط والأحكام، يرجى الاتصال بنا على [البريد الإلكتروني] أو [رقم الهاتف].''',
                              // Add your full text here
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ColorManager.darkBlueColor),
                            ),
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        checkColor: ColorManager.whiteColor,
                        activeColor: ColorManager.primaryBlueColor,
                        title: Text(
                          'accept the privacy policy and terms and conditions',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: ColorManager.blackColor),
                        ),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, // places the checkbox to the left
                      ),
                    ],
                  )),
              // /// Add Card Details Container ////////////////////////////////////////////////////////////////////
              // Padding(
              //   padding: const EdgeInsets.all(6),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       /// Enter Card Number TextField ////////////////////////////////////////
              //       CardCustom_TxtField(
              //           hintText: 'Enter Card Number',
              //           controller: cardNumberController,
              //           keyboardType: TextInputType.number,
              //           validator: (value) {
              //             if (value == null || value.trim().isEmpty) {
              //               return 'Please Enter Card Number';
              //             }
              //             return null;
              //           }),
              //       SizedBox(height: 8.h),
              //
              //       /// Enter Expire date & CVV TextField ////////////////////////////////////////
              //       Row(
              //         children: [
              //           Expanded(
              //             child: CardCustom_TxtField(
              //                 hintText: 'CVV',
              //                 controller: cvvController,
              //                 keyboardType: TextInputType.number,
              //                 validator: (value) {
              //                   if (value == null || value.trim().isEmpty) {
              //                     return 'Please Enter CVV';
              //                   }
              //                   return null;
              //                 }),
              //           ),
              //           Expanded(
              //             child: CardCustom_TxtField(
              //                 hintText: 'MM/YY',
              //                 controller: mmyyController,
              //                 keyboardType: TextInputType.number,
              //                 inputFormatter: [maskFormatter],
              //                 // Use mask formatter here
              //                 validator: (value) {
              //                   if (value == null || value.trim().isEmpty) {
              //                     return 'Please Enter MM/YY';
              //                   }
              //                   return null;
              //                 }),
              //           ),
              //         ],
              //       ),
              //       SizedBox(height: 8.h),
              //
              //       /// Enter Name TextField ////////////////////////////////////////
              //       CardCustom_TxtField(
              //           hintText: 'Enter Name',
              //           controller: nameController,
              //           keyboardType: TextInputType.text,
              //           validator: (value) {
              //             if (value == null || value.trim().isEmpty) {
              //               return 'Please Enter Name';
              //             }
              //             return null;
              //           }),
              //     ],
              //   ),
              // ),

              /// Pay Button & Price Container ////////////////////////////////////////////////////////////////////
              Container(
                height: 120.h,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.lightBlueColor,
                        // Shadow color with opacity
                        spreadRadius: 2,
                        // Spread radius
                        blurRadius: 4,
                        // Blur radius
                        offset:
                            Offset(0, 3), // Offset in the x and y directions
                      )
                    ],
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    color: ColorManager.whiteColor),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('2000 SR',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: ColorManager.primaryBlueColor)),
                          Text(
                            '(Total includes tax)',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: ColorManager.greyColor),
                          ),
                        ],
                      ),
                    ),
                    SmallElevatedbutton(
                        text: 'Pay',
                        onTap: () {
                          showVerifyOTPBottomSheet();
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showVerifyOTPBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Termsconditions_Bottomsheet();
      },
    );
  }
}

class Custom_Payment_Container extends StatelessWidget {
  Widget widget;

  Custom_Payment_Container({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.lightBlueColor,
              // Shadow color with opacity
              spreadRadius: 2, // Spread radius
              blurRadius: 4, // Blur radius
              offset: Offset(0, 3), // Offset in the x and y directions
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s12),
          color: ColorManager.whiteColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: widget,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.circle_outlined,
                  color: ColorManager.midBlueColor, size: 30))
        ],
      ),
    );
  }
}
