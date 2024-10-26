import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/verifyOTP_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../More_tab/cards_management/add_card_bottomsheet.dart';

class RechargeBalance_Screen extends StatefulWidget {
  @override
  State<RechargeBalance_Screen> createState() => _RechargeBalance_ScreenState();
}

class _RechargeBalance_ScreenState extends State<RechargeBalance_Screen> {
  bool isChecked = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController mmyyController = TextEditingController();
  int selectedOption = 0;

  // Mask formatter for MM/YY format
  final maskFormatter =
      MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Payment Screen')),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                child: Column(children: [
                  /// Payment Methods Containers ////////////////////////////////////////////////////////////////////
                  InkWell(
                      onTap: () {
                        selectOption(2);
                        setState(() {});
                      },
                      child: Custom_Payment_Container(
                          widget: Text('Saved Cards',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: ColorManager.darkBlueColor)))),
                  InkWell(
                      onTap: () {
                        selectOption(1);
                        setState(() {});
                      },
                      child: Custom_Payment_Container(
                          widget: Image.asset(
                              'assets/images/logos_mastercard.png'))),
                  InkWell(
                      onTap: () {
                        selectOption(1);
                        setState(() {});
                      },
                      child: Custom_Payment_Container(
                          widget: Image.asset(
                              'assets/images/Mada_Logo.svg 1.png'))),

                  selectedWidget(),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RechargeMoney_Container(text: '100'),
                            RechargeMoney_Container(text: '200')
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RechargeMoney_Container(text: '500'),
                              RechargeMoney_Container(text: '1000')
                            ]),
                        SizedBox(height: 10.h),
                        Container(
                          constraints:
                              BoxConstraints(maxHeight: 60, maxWidth: 290.w),
                          child: CardCustom_TxtField(
                              hintText: 'Custom Amount....',
                              controller: cardNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatter: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please Enter Card Number';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(height: 20.h),
                      ])),

                  ///////////////////////////   terms and conditions checkBox   //////////////////////////////////////////////
                  CheckboxListTile(
                      checkColor: ColorManager.whiteColor,
                      activeColor: ColorManager.primaryBlueColor,
                      title: Text(
                          'accept the privacy policy and terms and conditions',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: ColorManager.greyColor)),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading),

                  /// Pay Button & Price Container ////////////////////////////////////////////////////////////////////
                  Container(
                      height: 120.h,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: ColorManager.lightBlueColor,
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.circular(AppSize.s12),
                          color: ColorManager.whiteColor),
                      child: Row(children: [
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('500 SR',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: ColorManager
                                                  .primaryBlueColor))),
                            ])),
                        SmallElevatedbutton(
                            text: 'Recharge',
                            onPressed: () {
                              showVerifyOTPBottomSheet();
                            })
                      ]))
                ]))));
  }

  void showVerifyOTPBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return OTP_Bottomsheet();
        });
  }

  void selectOption(int option) {
    setState(() {
      selectedOption = option;
    });
  }

  Widget selectedWidget() {
    switch (selectedOption) {
      case 1:

        /// New Card Details Container ////////////////////////////////////////////////////////////////////
        return Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Enter Card Number TextField ////////////////////////////////////////
                  CardCustom_TxtField(
                      hintText: 'Enter Card Number',
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Card Number';
                        }
                        return null;
                      }),
                  SizedBox(height: 8.h),

                  /// Enter Expire date & CVV TextField ////////////////////////////////////////
                  Row(children: [
                    Expanded(
                      child: CardCustom_TxtField(
                          hintText: 'CVV',
                          inputFormatter: [
                            LengthLimitingTextInputFormatter(3),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: cvvController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please Enter CVV';
                            }
                            return null;
                          }),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                        child: CardCustom_TxtField(
                            hintText: 'MM/YY',
                            controller: mmyyController,
                            keyboardType: TextInputType.number,
                            inputFormatter: [maskFormatter],
                            // Use mask formatter here
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please Enter MM/YY';
                              }
                              return null;
                            }))
                  ]),
                  SizedBox(height: 8.h),

                  /// Enter Name TextField ////////////////////////////////////////
                  CardCustom_TxtField(
                      hintText: 'Enter Name',
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      })
                ]));

      /// Saved Card CVV Container ////////////////////////////////////////////////////////////////////
      case 2:
        return Container(
            padding: EdgeInsets.all(14.h),
            height: 140.h,
            child: CardCustom_TxtField(
                inputFormatter: [
                  LengthLimitingTextInputFormatter(3),
                  FilteringTextInputFormatter.digitsOnly
                ],
                hintText: 'CVV',
                controller: cvvController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.length > 3) {
                    return 'Please Enter CVV';
                  }
                  return null;
                }));
      default:
        return Container(
          height: 140.h,
        );
    }
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
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 3))
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
            ]));
  }
}

class RechargeMoney_Container extends StatefulWidget {
  String text;

  RechargeMoney_Container({required this.text});

  @override
  State<RechargeMoney_Container> createState() =>
      _RechargeMoney_ContainerState();
}

class _RechargeMoney_ContainerState extends State<RechargeMoney_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 50.h, minWidth: 120.w),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      margin: EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorManager.midWhiteColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(AppSize.s6),
          color: ColorManager.lightBlueColor),
      child: Center(
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorManager.darkBlueColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
