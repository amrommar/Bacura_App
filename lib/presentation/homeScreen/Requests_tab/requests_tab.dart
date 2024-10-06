import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Requests_Tab extends StatefulWidget {
  const Requests_Tab({super.key});

  @override
  State<Requests_Tab> createState() => _Requests_TabState();
}

class _Requests_TabState extends State<Requests_Tab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.greyColor,
    );
  }
}
