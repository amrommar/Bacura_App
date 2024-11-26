import 'package:bacura_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomerServiceMessage extends StatelessWidget {
  String sender;
  String message;
  String time;

  CustomerServiceMessage({
    super.key,
    required this.sender,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.headset_mic_outlined,
            color: ColorManager.primaryBlueColor,
          )),
      const SizedBox(width: 8),
      Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              sender,
              style: TextStyle(
                color: ColorManager.darkBlueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(message),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ]))
    ]);
  }
}
