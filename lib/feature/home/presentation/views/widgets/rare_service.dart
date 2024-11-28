import 'package:flutter/material.dart';

class RareService extends StatelessWidget {
  Function() onTap;
  String imagePath;

  RareService({super.key, required this.onTap, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
            margin: const EdgeInsets.all(8),
            child: ClipRRect(
                //// Form Back-End ///////////////////
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(imagePath))),
      ),
    );
  }
}
