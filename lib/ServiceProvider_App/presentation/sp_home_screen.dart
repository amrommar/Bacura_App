import 'package:bacura_app/ServiceProvider_App/presentation/wigdets/sp_request_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../providers/language_provider.dart';

class Sp_HomeScreen extends StatefulWidget {
  @override
  State<Sp_HomeScreen> createState() => _Sp_HomeScreenState();
}

class _Sp_HomeScreenState extends State<Sp_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
          titleSpacing: 5,
          centerTitle: false,
          title: Text('هلا، محمد',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.whiteColor,
                  )),
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.spPersonalDetailsRoute);
              },
              child: Row(children: [
                SizedBox(width: 8.w),
                Flexible(
                    child: CircleAvatar(
                        radius: 23.w,
                        backgroundColor: ColorManager.whiteColor,
                        child: Image.asset('assets/images/Ellipse 1.png')))
              ])),
          actions: [
            IconButton(
                icon: Icon(Icons.email_outlined, size: 30.h),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.messagesRoute);
                }),
            IconButton(
                icon: Icon(Icons.notifications, size: 30.h),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.notificationsRoute);
                }),
          ]),
      body: Column(children: [
        /// Requests section ///////////////////////////////////////////////////////
        Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return InkWell(onTap: () {}, child: SP_RequestContainer());
                }))
      ]),
    );
  }
}
