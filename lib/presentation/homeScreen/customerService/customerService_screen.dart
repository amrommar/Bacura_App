import 'package:bacura_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/values_manager.dart';

class Customerservice_Screen extends StatefulWidget {
  @override
  State<Customerservice_Screen> createState() => _CustomerserviceScreenState();
}

class _CustomerserviceScreenState extends State<Customerservice_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Customer Chat'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                  padding: EdgeInsets.all(5),
                  color: ColorManager.whiteColor,
                  child: Icon(
                    Icons.headset_mic_outlined,
                    size: 30,
                    color: ColorManager.primaryBlueColor,
                  )),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              children: [
                buildBotMessage("Customer Support",
                    "Hey, welcome to Service Customer Chat.", "11:25 am"),
                buildBotMessage("Bacura Support",
                    "What can we assist you with today?", "11:25 am"),
                buildUserMessage("Payments", "11:25 am"),
                buildBotMessage("Bacura Support",
                    "Select a topic you need help with.", "11:25 am"),
                buildUserMessage("Make a payment", "11:25 am"),
                buildBotMessage("Bacura Support",
                    "Select a payment you need help with", "11:25 am"),
              ],
            ),
          ),
          buildMessageInput(),
        ],
      ),
    );
  }

  Widget buildBotMessage(String sender, String message, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.grey.shade200,
          child: Icon(Icons.headset_mic_outlined,
              color: ColorManager.primaryBlueColor),
        ),
        SizedBox(width: 8),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(
                    color: ColorManager.darkBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(message),
              Text(
                time,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildUserMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerRight, // Align the message to the right
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorManager.lightBlueColor,
          borderRadius: BorderRadius.circular(15),
        ),
        // Let the content decide the width
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width *
              0.7, // Message won't exceed 70% of the screen width
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message),
            SizedBox(height: 5),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      height: 60,
      color: ColorManager.midWhiteColor,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.attachment, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorManager.whiteColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.midWhiteColor,
                      width: AppSize.s1,
                    ),
                    borderRadius: BorderRadius.circular(AppSize.s8)),
                hintText: "Type message here",
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: ColorManager.primaryBlueColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
