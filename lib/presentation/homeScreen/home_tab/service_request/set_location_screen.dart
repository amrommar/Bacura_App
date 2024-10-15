import 'package:bacura_app/presentation/homeScreen/home_tab/service_request/set_date_screen.dart';
import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:bacura_app/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SetLocation_Screen extends StatefulWidget {
  const SetLocation_Screen({super.key});

  @override
  State<SetLocation_Screen> createState() => _SetLocation_ScreenState();
}

class _SetLocation_ScreenState extends State<SetLocation_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Location')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.location_on,
              size: 200, color: ColorManager.lightGreyColor),
          Custom_ElevatedButton(
            onTap: () {
              Navigator.pushNamed(context, Routes.testRoute);
            },
          ),
        ],
      ),
    );
  }
}
