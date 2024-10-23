import 'package:bacura_app/presentation/homeScreen/Requests_tab/widgets/customdeposit_container.dart';
import 'package:bacura_app/presentation/homeScreen/personal/widgets/custompayment_container.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastOperations_Screen extends StatefulWidget {
  @override
  State<LastOperations_Screen> createState() => _LastOperations_ScreenState();
}

class _LastOperations_ScreenState extends State<LastOperations_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Last Operations')),
      body: Column(
        children: [
          ///////// ALL  -  Payments  -  Deposits   Filtering   ///////////////
          Container(
            padding: EdgeInsets.only(top: 8),
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  child: Text(
                    'All',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.darkBlueColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                VerticalDivider(
                    color: ColorManager.lightBlueColor, thickness: 2),
                Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  child: Text(
                    'Payments',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.greyColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                VerticalDivider(
                    color: ColorManager.lightBlueColor, thickness: 2),
                Container(
                  width: 100.w,
                  alignment: Alignment.center,
                  child: Text('Deposits',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.greyColor,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Divider(color: ColorManager.lightBlueColor, thickness: 2),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Customdeposit_Container(),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.invoiceDetailsRoute);
                        },
                        child: CustomPaymentOperation_Container()),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
