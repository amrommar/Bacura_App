import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Cart_Tab extends StatefulWidget {
  const Cart_Tab({super.key});

  @override
  State<Cart_Tab> createState() => _Cart_TabState();
}

class _Cart_TabState extends State<Cart_Tab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: ColorManager.whiteColor,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: ColorManager.primaryBlueColor,
          size: 150,
        ),
      ),
    );
  }
}
