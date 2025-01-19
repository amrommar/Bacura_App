import 'package:bacura_app/core/utils/index.dart';

class RechargeBalance_Screen extends StatefulWidget {
  const RechargeBalance_Screen({super.key});

  @override
  State<RechargeBalance_Screen> createState() => _RechargeBalance_ScreenState();
}

class _RechargeBalance_ScreenState extends State<RechargeBalance_Screen> {
  bool isChecked = false;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController mmyyController = TextEditingController();
  int selectedOption = 0;
  var formKey = GlobalKey<FormState>();

  // Mask formatter for MM/YY format
  final maskFormatter = MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.recharge_screen)),
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
                          widget: Text(AppLocalizations.of(context)!.saved_cards,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.darkBlueColor)))),
                  InkWell(
                      onTap: () {
                        selectOption(1);
                        setState(() {});
                      },
                      ////  image for the MasterCard ///////////////////////////
                      child: Custom_Payment_Container(
                        widget: Image.asset('assets/images/logos_mastercard.png'),
                      )),
                  InkWell(
                      onTap: () {
                        selectOption(1);
                        setState(() {});
                      },
                      ////  image for the Mada ///////////////////////////

                      child: Custom_Payment_Container(
                        widget: Image.asset('assets/images/Mada_Logo.svg 1.png'),
                      )),

                  Form(
                      key: formKey,
                      child: Column(children: [
                        selectedWidget(),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            child: Column(children: [
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                RechargeMoney_Container(text: '100'),
                                RechargeMoney_Container(text: '200'),
                              ]),
                              SizedBox(height: 10.h),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                RechargeMoney_Container(text: '500'),
                                RechargeMoney_Container(text: '1000'),
                              ]),
                              SizedBox(height: 10.h),
                              Container(
                                  constraints: BoxConstraints(maxWidth: 290.w),
                                  child: CardCustom_TxtField(
                                      hintText: AppLocalizations.of(context)!.custom_amount,
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return AppLocalizations.of(context)!.please_enter_amount;
                                        }
                                        return null;
                                      })),
                              SizedBox(height: 10.h),
                            ])),

                        ///////////////////////////   terms and conditions checkBox   //////////////////////////////////////////////
                        CheckboxListTile(
                            checkColor: ColorManager.whiteColor,
                            activeColor: ColorManager.primaryBlueColor,
                            title: Text(
                              AppLocalizations.of(context)!.accept_the_privacy_policy_and_terms_and_conditions,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
                            ),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading)
                      ])),

                  /// Pay Button & Price Container ////////////////////////////////////////////////////////////////////
                  Container(
                      height: 120.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: ColorManager.lightBlueColor,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        )
                      ], borderRadius: BorderRadius.circular(AppSize.s12), color: ColorManager.whiteColor),
                      child: Row(children: [
                        Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                              child: Text('500 ريال', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.primaryBlueColor))),
                        ])),
                        SmallElevatedButton(
                            text: AppLocalizations.of(context)!.recharge,
                            onPressed: () {
                              if (formKey.currentState!.validate() == true && isChecked) {
                                showVerifyOTPBottomSheet();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: ColorManager.midWhiteColor,
                                  content: Text(
                                    AppLocalizations.of(context)!.accept_the_privacy_policy_and_terms_and_conditions,
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorManager.darkRedColor, fontSize: 14),
                                  ),
                                ));
                              }
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
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
              /// Enter Card Number TextField ////////////////////////////////////////
              CardCustom_TxtField(
                  hintText: AppLocalizations.of(context)!.enter_card_number,
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.please_enter_card_number;
                    }
                    return null;
                  }),
              SizedBox(height: 8.h),

              /// Enter Expire date & CVV TextField ////////////////////////////////////////
              Row(children: [
                Expanded(
                  child: CardCustom_TxtField(
                      hintText: AppLocalizations.of(context)!.cvv,
                      inputFormatter: [LengthLimitingTextInputFormatter(3), FilteringTextInputFormatter.digitsOnly],
                      controller: cvvController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.cvv;
                        }
                        return null;
                      }),
                ),
                SizedBox(width: 10.w),
                Expanded(
                    child: CardCustom_TxtField(
                        hintText: AppLocalizations.of(context)!.mm_yy,
                        controller: mmyyController,
                        keyboardType: TextInputType.number,
                        inputFormatter: [maskFormatter],
                        // Use mask formatter here
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return AppLocalizations.of(context)!.please_enter_mm_yy;
                          }
                          return null;
                        }))
              ]),
              SizedBox(height: 8.h),

              /// Enter Name TextField ////////////////////////////////////////
              CardCustom_TxtField(
                  hintText: AppLocalizations.of(context)!.enterYourName,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.pleaseEnterYourName;
                    }
                    return null;
                  })
            ]));

      /// Saved Card CVV Container ////////////////////////////////////////////////////////////////////
      case 2:
        return Container(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
            height: 140.h,
            child: CardCustom_TxtField(
                inputFormatter: [LengthLimitingTextInputFormatter(3), FilteringTextInputFormatter.digitsOnly],
                hintText: AppLocalizations.of(context)!.cvv,
                controller: cvvController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty || value.length > 3) {
                    return AppLocalizations.of(context)!.please_enter_cvv;
                  }
                  return null;
                }));
      default:
        return Container(height: 120.h);
    }
  }
}

class Custom_Payment_Container extends StatelessWidget {
  Widget widget;

  Custom_Payment_Container({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorManager.lightBlueColor,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          )
        ], borderRadius: BorderRadius.circular(AppSize.s12), color: ColorManager.whiteColor),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: widget,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h), child: Icon(Icons.circle_outlined, color: ColorManager.midBlueColor, size: 30))
        ]));
  }
}

class RechargeMoney_Container extends StatefulWidget {
  String text;

  RechargeMoney_Container({super.key, required this.text});

  @override
  State<RechargeMoney_Container> createState() => _RechargeMoney_ContainerState();
}

class _RechargeMoney_ContainerState extends State<RechargeMoney_Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minHeight: 50.h, minWidth: 120.w),
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.midWhiteColor,
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(AppSize.s6),
          color: ColorManager.lightBlueColor,
        ),
        child: Center(
            child: Text(
          widget.text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.darkBlueColor, fontWeight: FontWeight.w500),
        )));
  }
}
