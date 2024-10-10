import 'package:bacura_app/presentation/homeScreen/More_tab/cards_management/add_card_bottomsheet.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cards_Management_Screen extends StatefulWidget {
  @override
  State<Cards_Management_Screen> createState() =>
      _Cards_Management_ScreenState();
}

class _Cards_Management_ScreenState extends State<Cards_Management_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Management'),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(
            horizontal: AppMargin.m10, vertical: AppMargin.m20),
        child: FloatingActionButton(
          elevation: 5,
          shape: CircleBorder(),
          focusColor: ColorManager.lightBlueColor,
          backgroundColor: ColorManager.lightBlueColor,
          // backgroundColor: Color(0xff206ff4),
          onPressed: () {
            showAddCardBottomSheet();
          },
          child: Icon(
            Icons.add_card,
            color: ColorManager.primaryBlueColor,
            size: 30, // Icon color inside the FAB
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(
                  right: AppPadding.p20,
                  top: AppPadding.p16,
                  left: AppPadding.p20),
              child: Stack(children: [
                SvgPicture.asset('assets/images/card_img.svg'),
                Container(
                  height: 245.h,
                  padding: EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.edit,
                            color: ColorManager.whiteColor,
                          ),
                          Container(
                              height: 40.h,
                              child:
                                  Image.asset('assets/images/alrajhi_logo.png'))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 40.h,
                              child: Image.asset('assets/images/mada_logo.png'))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('**** **** **** ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: ColorManager.whiteColor,
                                      letterSpacing: 4.0)),
                          Text('2345',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: ColorManager.whiteColor,
                                      letterSpacing: 1.0)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Card Holder Number',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorManager.whiteColor,
                                          fontSize: 11)),
                              Text('Amr Omar',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorManager.whiteColor)),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Expire Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorManager.whiteColor,
                                          fontSize: 11)),
                              Text('15/04',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorManager.whiteColor)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            );
          }),
    );
  }

  void showAddCardBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddCard_BottomSheet();
        });
  }
}
