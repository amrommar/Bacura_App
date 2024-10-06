import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class More_Tab extends StatefulWidget {
  const More_Tab({super.key});

  @override
  State<More_Tab> createState() => _More_TabState();
}

class _More_TabState extends State<More_Tab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightBlueColor,
    );
  }
}
