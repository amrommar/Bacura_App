import 'package:bacura_app/core/utils/index.dart';

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
  int selectedOption = 0;
  var formKey = GlobalKey<FormState>();

  // Mask formatter for MM/YY format
  final maskFormatter = MaskTextInputFormatter(mask: '##/##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.payment_screen)),
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
                    child: CustomShadowContainerRow(
                        widget: Text(AppLocalizations.of(context)!.saved_cards,
                            style:
                                Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.darkBlueColor))),
                  ),

                  InkWell(
                      onTap: () {
                        selectOption(1);
                        setState(() {});
                      },
                      //// from BackEnd //////////////////////////////////
                      child: CustomShadowContainerRow(widget: Image.asset('assets/images/logos_mastercard.png'))),

                  InkWell(
                      onTap: () {
                        selectOption(1);
                        setState(() {});
                      },
                      //// from BackEnd //////////////////////////////////

                      child: CustomShadowContainerRow(widget: Image.asset('assets/images/Mada_Logo.svg 1.png'))),
                  InkWell(
                      onTap: () {
                        selectOption(3);
                        setState(() {});
                      },
                      child: CustomShadowContainerRow(
                          widget: Text(AppLocalizations.of(context)!.pay_from_wallet,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: ColorManager.darkBlueColor)))),

                  Container(height: 320.h, child: Form(key: formKey, child: selectedWidget())),
                  ///////////////////////////   terms and conditions checkBox   //////////////////////////////////////////////
                  CheckboxListTile(
                    checkColor: ColorManager.whiteColor,
                    activeColor: ColorManager.primaryBlueColor,
                    title: Text(AppLocalizations.of(context)!.accept_the_privacy_policy_and_terms_and_conditions,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor)),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),

                  /// Pay Button & Price Container ////////////////////////////////////////////////////////////////////
                  Container(
                      height: 120.h,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: ColorManager.lightBlueColor, spreadRadius: 2, blurRadius: 4, offset: Offset(0, 3))
                      ], borderRadius: BorderRadius.circular(AppSize.s12), color: ColorManager.whiteColor),
                      child: Row(children: [
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              /// from Back-end //////////////
                              Text('2000 ريال',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: ColorManager.primaryBlueColor)),
                              Text(
                                AppLocalizations.of(context)!.total_includes_tax,
                                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor),
                              )
                            ])),
                        SmallElevatedButton(
                            text: AppLocalizations.of(context)!.pay,
                            onPressed: () {
                              if (formKey.currentState!.validate() == true && isChecked) {
                                showVerifyOTPBottomSheet();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: ColorManager.midWhiteColor,
                                  content: Text(
                                    AppLocalizations.of(context)!.accept_the_privacy_policy_and_terms_and_conditions,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: ColorManager.darkRedColor, fontSize: 14),
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
      },
    );
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
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// Enter Card Number TextField ////////////////////////////////////////
                  CardCustom_TxtField(
                      hintText: AppLocalizations.of(context)!.enter_card_number,
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatter: [
                        // Limit to 3 characters
                        FilteringTextInputFormatter.digitsOnly // Only allow digits
                      ],
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppLocalizations.of(context)!.please_enter_card_number;
                        }
                        return null;
                      }),
                  SizedBox(height: 5.h),

                  /// Enter Expire date & CVV TextField ////////////////////////////////////////
                  Row(
                    children: [
                      Expanded(
                        child: CardCustom_TxtField(
                            hintText: AppLocalizations.of(context)!.cvv,
                            inputFormatter: [
                              LengthLimitingTextInputFormatter(3),
                              // Limit to 3 characters
                              FilteringTextInputFormatter.digitsOnly,
                              // Only allow digits
                            ],
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return AppLocalizations.of(context)!.please_enter_cvv;
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
                            }),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),

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
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: CardCustom_TxtField(
                inputFormatter: [
                  LengthLimitingTextInputFormatter(3), // Limit to 3 characters
                  FilteringTextInputFormatter.digitsOnly, // Only allow digits
                ],
                hintText: AppLocalizations.of(context)!.cvv,
                controller: cvvController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty || value.length > 3) {
                    return AppLocalizations.of(context)!.please_enter_cvv;
                  }
                  return null;
                }));

      /// Pay From Wallet Details Container ////////////////////////////////////////////////////////////////////
      case 3:
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                Text(
                  AppLocalizations.of(context)!.your_wallet_balance,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorManager.darkBlueColor,
                      ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                    //// from Back-end /////////////////////
                    child: Text(
                  '1500',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorManager.primaryBlueColor,
                      ),
                ))
              ]),
              SizedBox(height: 10.h),
              Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  '*',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorManager.greyColor),
                ),
                SizedBox(width: 10.w),
                Expanded(

                    /// under updating i want to make it with better design /////////////////
                    child: Text('سيتم خصم المبلغ من المحفظة مباشرة.',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.greyColor)))
              ])
            ]));
      default:
        return Container(
          child: Center(
            child: Text('حدد الطريقة المناسبة',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.lightGreyColor)),
          ),
        );
    }
  }
}
