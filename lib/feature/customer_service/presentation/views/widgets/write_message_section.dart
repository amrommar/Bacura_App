import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:bacura_app/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class WriteMessageSection extends StatelessWidget {
  const WriteMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        height: 60,
        color: ColorManager.midWhiteColor,
        child: Row(children: [
          IconButton(
            icon: const Icon(Icons.attachment, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
              child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorManager.whiteColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorManager.midWhiteColor, width: AppSize.s1),
                          borderRadius: BorderRadius.circular(AppSize.s8)),
                      hintText: "Type message here"))),
          IconButton(icon: Icon(Icons.send, color: ColorManager.primaryBlueColor), onPressed: () {})
        ]));
  }
}
