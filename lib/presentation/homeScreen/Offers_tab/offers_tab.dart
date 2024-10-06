import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Offers_Tab extends StatefulWidget {
  const Offers_Tab({super.key});

  @override
  State<Offers_Tab> createState() => _Offers_TabState();
}

class _Offers_TabState extends State<Offers_Tab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.redColor,
    );
  }
}
