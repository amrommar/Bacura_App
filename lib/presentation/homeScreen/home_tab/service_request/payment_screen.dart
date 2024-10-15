import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/small_elevatedbutton.dart';
import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/widgets/termsconditions_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import '../../More_tab/cards_management/add_card_bottomsheet.dart';

class Payment_Screen extends StatefulWidget {
  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {
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
                  imgPath: 'assets/images/logos_mastercard.png'),
              Custom_Payment_Container(
                  imgPath: 'assets/images/Mada_Logo.svg 1.png'),
              Custom_Payment_Container(
                  imgPath: 'assets/images/logos_mastercard.png'),
              Custom_Payment_Container(
                  imgPath: 'assets/images/Mada_Logo.svg 1.png'),
              SizedBox(height: 20.h),

              /// Add Card Details Container ////////////////////////////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// Enter Card Number TextField ////////////////////////////////////////
                    CardCustom_TxtField(
                        hintText: 'Enter Card Number',
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please Enter Card Number';
                          }
                          return null;
                        }),
                    SizedBox(height: 8.h),

                    /// Enter Expire date & CVV TextField ////////////////////////////////////////
                    Row(
                      children: [
                        Expanded(
                          child: CardCustom_TxtField(
                              hintText: 'CVV',
                              controller: cvvController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please Enter CVV';
                                }
                                return null;
                              }),
                        ),
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
                              }),
                        ),
                      ],
                    ),
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
                        }),
                  ],
                ),
              ),
              SizedBox(height: 130.h),

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
                          showTermsBottomSheet();
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

  void showTermsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Termsconditions_Bottomsheet();
      },
    );
  }
}

class Custom_Payment_Container extends StatelessWidget {
  String imgPath;

  Custom_Payment_Container({required this.imgPath});

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
          Image.asset(imgPath, height: 50.h),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.circle_outlined,
                  color: ColorManager.midBlueColor, size: 30))
        ],
      ),
    );
  }
}
